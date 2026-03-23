import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? imageUrl;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.label,
    required this.icon,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(icon, color: const Color(0xFFBFD0FF)),
      title: imageUrl != null
          ? Image.asset(
              imageUrl!,
              height: 30,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            )
          : Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
