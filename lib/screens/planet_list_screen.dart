import 'package:flutter/material.dart';

import '../data/planet/planet_list.dart';
import '../widgets/app_drawer.dart';
import '../widgets/planet_card.dart';
import '../widgets/section_title.dart';
import 'planet_detail_screen.dart';

class PlanetListScreen extends StatelessWidget {
  const PlanetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1431),
        toolbarHeight: 95,
        title: Image.asset(
          'assets/images/ultraman-logo.png',
          height: 75,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Planets');
          },
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  title: 'Planet Categories',
                  icon: Icons.travel_explore,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Key worlds connected to Ultraman history.',
                  style: TextStyle(color: Color(0xFFC9D9FF)),
                ),
                const SizedBox(height: 14),
                Column(
                  children: planetList
                      .map(
                        (planet) => PlanetCard(
                          planet: planet,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    PlanetDetailScreen(planet: planet),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
