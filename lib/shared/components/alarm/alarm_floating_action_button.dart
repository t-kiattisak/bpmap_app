import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:flutter/material.dart';

class AlarmFloatingActionButton extends StatefulWidget {
  const AlarmFloatingActionButton({super.key, required this.child});

  final Widget child;

  @override
  State<AlarmFloatingActionButton> createState() =>
      _AlarmFloatingActionButtonState();
}

class _AlarmFloatingActionButtonState extends State<AlarmFloatingActionButton>
    with WidgetsBindingObserver {
  AlarmSet? _lastRingingAlarms;
  StreamSubscription<AlarmSet>? _ringingSub;
  Timer? _alarmCheckTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _ringingSub = Alarm.ringing.listen((alarmSet) {
      log('[HandleAlarm] alarms hee =>> $alarmSet');
      if (mounted) {
        setState(() {
          _lastRingingAlarms = alarmSet;
          if (alarmSet.alarms.isNotEmpty) {
            _startAlarmCheck();
          } else {
            _stopAlarmCheck();
          }
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkRingingAlarms();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkRingingAlarms();
    }
  }

  Future<void> _checkRingingAlarms() async {
    final hasAlarms =
        _lastRingingAlarms != null && _lastRingingAlarms!.alarms.isNotEmpty;
    if (hasAlarms) {
      _startAlarmCheck();
    }
  }

  void _startAlarmCheck() {
    _alarmCheckTimer?.cancel();
    _alarmCheckTimer = Timer.periodic(const Duration(seconds: 1), (
      timer,
    ) async {
      if (_lastRingingAlarms == null || _lastRingingAlarms!.alarms.isEmpty) {
        timer.cancel();
        return;
      }

      bool isAnyRinging = false;
      for (final alarm in _lastRingingAlarms!.alarms) {
        if (await Alarm.isRinging(alarm.id)) {
          isAnyRinging = true;
          break;
        }
      }

      if (!isAnyRinging && mounted) {
        setState(() {
          _lastRingingAlarms = null;
        });
        timer.cancel();
      }
    });
  }

  void _stopAlarmCheck() {
    _alarmCheckTimer?.cancel();
    _alarmCheckTimer = null;
  }

  @override
  void dispose() {
    _ringingSub?.cancel();
    _alarmCheckTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasRingingAlarms = _lastRingingAlarms?.alarms.isNotEmpty == true;

    return Stack(
      children: [
        widget.child,
        if (hasRingingAlarms)
          Positioned(
            bottom: 60,
            right: 16,
            child: SafeArea(
              child: FloatingActionButton.extended(
                onPressed: () => _handlePressed(context),
                backgroundColor: Colors.red,
                label: const Text('Emergency'),
                icon: const Icon(Icons.warning_amber_rounded),
              ),
            ),
          ),
      ],
    );
  }

  void _handlePressed(BuildContext context) {
    final alarms = _lastRingingAlarms?.alarms;
    if (alarms == null || alarms.isEmpty) return;

    final sortedAlarms = List<AlarmSettings>.from(alarms);
    sortedAlarms.sort((a, b) => b.id.compareTo(a.id));
    final first = sortedAlarms.first;
    final payload = first.payload;

    if (payload != null && payload.isNotEmpty) {
      try {
        final data = jsonDecode(payload) as Map<String, dynamic>;
        final id = data['alarm_id']?.toString() ?? 'unknown';

        final navContext = rootNavigatorKey.currentContext;
        if (navContext != null) {
          IncidentGuidelineRoute(id: id).push(navContext);
        }
      } catch (e) {
        debugPrint('Error parsing alarm payload: $e');
      }
    }
  }
}
