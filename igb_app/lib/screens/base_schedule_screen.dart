import 'package:flutter/material.dart';

import '../widgets/event_tile.dart'; // kafelek wydarzenia
import '../models/event_item.dart'; // model eventu

abstract class BaseScheduleScreen extends StatelessWidget {
  final String systemName;

  const BaseScheduleScreen({super.key, required this.systemName});

  Map<String, List<EventItem>> buildSchedule();

  @override
  Widget build(BuildContext context) {
    final schedule = buildSchedule();

    return Scaffold(
      appBar: AppBar(
        title: Text("Harmonogram – $systemName"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: schedule.entries.map((entry) {
            final day = entry.key;
            final events = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...events.map((e) => EventTile(event: e)),
                const SizedBox(height: 24),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
