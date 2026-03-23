import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/planet_list_screen.dart';
import '../screens/ultraman_list_screen.dart';
import 'category_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B1431),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ultraman Logo Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Image.asset(
                  'assets/images/ultraman-logo.png',
                  height: 60,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  },
                ),
              ),
              const Divider(color: Color(0xFF2E417C)),
              CategoryTile(
                label: 'Home',
                icon: Icons.home_filled,
                onTap: () => _go(context, const HomeScreen()),
              ),
              CategoryTile(
                label: 'Ultraman',
                icon: Icons.shield,
                onTap: () => _go(context, const UltramanListScreen()),
              ),
              CategoryTile(
                label: 'Planets',
                icon: Icons.public,
                onTap: () => _go(context, const PlanetListScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
