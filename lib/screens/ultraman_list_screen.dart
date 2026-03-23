import 'package:flutter/material.dart';

import '../data/ultraman/ultraman_list.dart';
import '../widgets/app_drawer.dart';
import '../widgets/section_title.dart';
import '../widgets/ultraman_card.dart';
import 'ultraman_detail_screen.dart';

class UltramanListScreen extends StatelessWidget {
  const UltramanListScreen({super.key});

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
            return const Text('Ultraman');
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
                const SectionTitle(title: 'Ultras', icon: Icons.shield),
                const SizedBox(height: 8),
                const Text(
                  'From the first Ultraman to the latest era.',
                  style: TextStyle(color: Color(0xFFC9D9FF)),
                ),
                const SizedBox(height: 14),
                Column(
                  children: ultramanList
                      .map(
                        (ultra) => UltramanCard(
                          ultraman: ultra,
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                      return UltramanDetailScreen(
                                        ultraman: ultra,
                                      );
                                    },
                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
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
