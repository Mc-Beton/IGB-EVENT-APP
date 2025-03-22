import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool big;
  final Color? color;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.big = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: big ? 60 : 40, color: Colors.cyan),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: big ? 22 : 16,
                fontWeight: big ? FontWeight.bold : FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
