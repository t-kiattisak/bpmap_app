import 'package:flutter/material.dart';

class IncidentGuidelinePage extends StatelessWidget {
  const IncidentGuidelinePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แนวทางปฏิบัติ')),
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
