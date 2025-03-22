import 'package:flutter/material.dart';
import '../models/event_item.dart';

class EventTile extends StatelessWidget {
  final EventItem event;

  const EventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    Color tileColor = const Color(0xFFF5F5F5); // domyślny kolor tła

    if (now.isAfter(event.start) && now.isBefore(event.end)) {
      // aktualnie trwa
      tileColor = Colors.cyan.withOpacity(0.3);
    } else if (now.isBefore(event.start) &&
        event.start.difference(now).inMinutes <= 15) {
      // zacznie się w ciągu 15 minut
      tileColor = Colors.yellow.withOpacity(0.4);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(1, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            event.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            "${_formatTime(event.start)} – ${_formatTime(event.end)}",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dt) {
    return "${_twoDigits(dt.hour)}:${_twoDigits(dt.minute)}";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
