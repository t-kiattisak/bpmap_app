import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import 'package:flutter/material.dart';

class IncidentGuidelinePage extends StatelessWidget {
  const IncidentGuidelinePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แนวทางปฏิบัติ')),
      floatingActionButton: StreamBuilder<AlarmSet>(
        stream: Alarm.ringing,
        builder: (context, snapshot) {
          final isRinging = snapshot.data?.alarms.isNotEmpty ?? false;
          if (!isRinging) return SizedBox();
          return FloatingActionButton(
            onPressed: () async {
              final data = snapshot.data;
              if (data != null) {
                for (final a in data.alarms) {
                  await Alarm.stop(a.id);
                }
              }
            },
            child: Icon(Icons.alarm_off),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'เหตุการณ์ ID: $id',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              const Text(
                'เนื้อหาแนวทางปฏิบัติจะแสดงที่นี่',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
