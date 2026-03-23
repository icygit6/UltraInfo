import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: -0.15,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFF1E2F62),
            child: Icon(icon, size: 16, color: const Color(0xFFBFD0FF)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
