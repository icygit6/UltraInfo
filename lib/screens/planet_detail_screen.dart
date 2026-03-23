import 'package:flutter/material.dart';

import '../models/planet.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  const PlanetDetailScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1431),
        toolbarHeight: 75,
        title: Text(planet.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: planet.name,
                child: Image.network(
                  planet.resolvedImageUrl,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 260,
                      color: const Color(0xFF1B2E5E),
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 42),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planet.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      planet.description,
                      style: const TextStyle(
                        color: Color(0xFFDDE7FF),
                        fontSize: 15,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Divider(color: Color(0xFF30467F)),
                    const SizedBox(height: 10),
                    const Text(
                      'Related Ultramans',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final name in planet.relatedUltramans)
                          Chip(
                            label: Text(name),
                            backgroundColor: const Color(0xFF1E3368),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
