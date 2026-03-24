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
                  title: 'Ultraman History',
                  icon: Icons.history,
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
                  child: const SingleChildScrollView(
                    child: Text(
                      '''1. Pre-Ultraman Foundations (Early 1960s)

Before Ultraman existed, Eiji Tsuburaya was already a pioneer in tokusatsu. He co-created Godzilla at Toho and specialized in miniature models, practical effects, and suit acting. After leaving Toho, he founded Tsuburaya Productions in 1963. His goal: Create a TV-friendly sci-fi hero combining monster action (kaiju), science fiction, and human drama.

2. Birth of the Ultra Series (1966)

Ultra Q was the prototype - the first show in twilight zone-style monster anthology format with no Ultraman yet, establishing kaiju storytelling and tone. Ultraman (1966) was the breakthrough. The core concept: an alien being merges with a human (Shin Hayata) to fight giant monsters. Innovations included the "giant hero vs giant monster" format, color timer (3-minute energy limit), and signature beam attacks. This became the template for decades of shows.

3. Early Expansion & Golden Age (1967-1970s)

Ultraseven represented a shift in tone - more philosophical and darker, focusing on alien civilizations and moral dilemmas. It's often considered one of the most critically respected Ultra series. Late 60s-70s introduced many Ultras: Return of Ultraman, Ultraman Ace, and Ultraman Taro. Key developments expanded the "Land of Light" lore, introduced Ultra Brothers (shared universe idea), and featured more toy-friendly designs. During this era, Ultraman became a national icon in Japan with massive merchandising boom and inspired future tokusatsu like Kamen Rider.

4. Decline & Dormant Period (Late 1970s-1980s)

After years of success, problems arose: oversaturation of similar shows, rising competition, and changing audience interests. Output slowed with fewer new series and some experimental entries like Ultraman 80. Ultraman didn't disappear, but it lost mainstream dominance.

5. Heisei Revival Era (1990s-Early 2000s)

Ultraman Tiga was the rebirth. It mattered because of modern storytelling, cinematic visuals, and more emotional depth. It reintroduced Ultraman to a new generation. Continued success followed with Ultraman Dyna and Ultraman Gaia. Improvements included stronger character arcs, better CGI and practical effects mix, and complex villains. The experimental 2000s phase included Ultraman Nexus (darker tone) and Ultraman Max (classic style return), with shows experimenting with tone - some aimed at adults, others at kids.

6. Globalization & New Generation Era (2010s)

The Ultraman Ginga era brought key changes: lower budgets but creative storytelling and focus on collectibility (toys/cards). New Generation Heroes included Ultraman X, Ultraman Orb, and Ultraman Geed, introducing fusion/transformation gimmicks and legacy references to older Ultras.

7. Streaming & Modern Popularity (Late 2010s-Present)

Netflix Adaptation: Ultraman differs from the traditional format - not giant-sized battles but focuses on sci-fi armor suits with a darker, more mature tone. Recent Series include Ultraman Z and Ultraman Blazar, bringing strong storytelling and international accessibility through YouTube releases.

8. Core Lore & Concepts

The Land of Light is the home planet of Ultramen - an advanced civilization of giant beings. Ultramen often merge with humans and share consciousness. Energy Limitation follows the 3-minute rule symbolized by a color timer. Kaiju and Aliens represent natural disasters, war, or human mistakes.

9. Themes & Meaning

Ultraman is more than action. Recurring themes include responsibility of power, human weakness vs heroism, coexistence with nature, and sacrifice and hope. Especially in Ultraseven and Ultraman Nexus, themes get surprisingly deep.

10. Cultural & Global Impact

Ultraman influenced the tokusatsu genre worldwide, western superhero storytelling styles, and generations of filmmakers. It's popular outside Japan in China, Southeast Asia (including Taiwan), and growing with western audience.''',
                      style: const TextStyle(
                        color: Color(0xFFE2EBFF),
                        fontSize: 13,
                        height: 1.6,
                      ),
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
