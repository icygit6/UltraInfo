import 'package:flutter/material.dart';

import '../models/ultraman.dart';

class UltramanCard extends StatelessWidget {
  final Ultraman ultraman;
  final VoidCallback? onTap;

  const UltramanCard({super.key, required this.ultraman, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 17),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF13224D), Color(0xFF0E193D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(19),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Hero(
                  tag: ultraman.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      ultraman.resolvedImageUrl,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 110,
                          height: 110,
                          color: const Color(0xFF21376B),
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image_outlined),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE082),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'ULTRA',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0B1431),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.flash_on,
                        size: 22,
                        color: Color(0xFFFFE082),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          ultraman.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    ultraman.origin,
                    style: const TextStyle(
                      color: Color(0xFFC8D7FF),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    ultraman.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFE4ECFF),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
