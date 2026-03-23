import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final bannerHeight = width > 420 ? 312.0 : 264.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1431),
        toolbarHeight: 75,
        title: Image.asset(
          'assets/images/ultraman-logo.png',
          height: 55,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Planet M78');
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
                  title: 'Planet M78',
                  icon: Icons.auto_awesome,
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=1400&q=80',
                        width: double.infinity,
                        height: bannerHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: bannerHeight,
                            color: const Color(0xFF1A2B59),
                            alignment: Alignment.center,
                            child: const Icon(Icons.broken_image, size: 48),
                          );
                        },
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.15),
                                Colors.black.withValues(alpha: 0.75),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 17,
                        right: 17,
                        bottom: 17,
                        child: Text(
                          'Land of Light - the legendary home of Ultra warriors.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF142555), Color(0xFF0F1A3E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Text(
                    'Planet M78 is the symbolic birthplace of many Ultraman heroes. '
                    'This app introduces Ultramans in proper order and shows key planets '
                    'related to their stories. Use the sidebar to navigate categories.',
                    style: TextStyle(
                      color: Color(0xFFE2EBFF),
                      fontSize: 18,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
