import 'package:flutter/material.dart';

import '../models/planet.dart';

class PlanetCard extends StatelessWidget {
  final Planet planet;
  final VoidCallback? onTap;

  const PlanetCard({super.key, required this.planet, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 17),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF12224E),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          children: [
            Hero(
              tag: planet.name,
              child: CircleAvatar(
                radius: 41,
                backgroundImage: NetworkImage(planet.resolvedImageUrl),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    planet.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFD9E5FF),
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
