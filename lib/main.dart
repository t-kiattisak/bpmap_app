import 'package:flutter/material.dart';

/// Legacy root widget; the app uses [AppWithBloc] from main_common.
/// Kept for tests that import package:bpmap_app/main.dart.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPMap',
      home: Scaffold(
        body: Center(child: Text('BPMap')),
      ),
    );
  }
}
