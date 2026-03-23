import 'package:flutter/material.dart';

import '../models/ultraman.dart';
import '../widgets/section_title.dart';

class UltramanDetailScreen extends StatelessWidget {
  final Ultraman ultraman;

  const UltramanDetailScreen({super.key, required this.ultraman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image layer
            Positioned.fill(
              child: Image.network(
                ultraman.backgroundImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFF0B1431));
                },
              ),
            ),
            // Dark gradient overlay - darkened
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0.75),
                      Colors.black.withOpacity(0.65),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            // Scrollable foreground content
            CustomScrollView(
              slivers: [
                // Custom header with logo
                SliverAppBar(
                  expandedHeight: 140,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Hero(
                      tag: ultraman.name,
                      child: Text(
                        ultraman.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  leading: Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                // Content sections
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Origin information
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.public,
                                color: Color(0xFFB9CCFF),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Origin: ${ultraman.origin}',
                                  style: const TextStyle(
                                    color: Color(0xFFE0E9FF),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Overview section (short description)
                        SectionTitle(title: 'Overview', icon: Icons.visibility),
                        const SizedBox(height: 12),
                        Text(
                          ultraman.description,
                          style: const TextStyle(
                            color: Color(0xFFD9E6FF),
                            fontSize: 15,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFF2A3D6F), thickness: 1),
                        const SizedBox(height: 24),
                        // Description section (full description)
                        SectionTitle(
                          title: 'Description',
                          icon: Icons.description,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          ultraman.fullDescription,
                          style: const TextStyle(
                            color: Color(0xFFD9E6FF),
                            fontSize: 15,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFF2A3D6F), thickness: 1),
                        const SizedBox(height: 24),
                        // Profile section
                        SectionTitle(title: 'Profile', icon: Icons.info),
                        const SizedBox(height: 16),
                        _buildProfileRow('Height', ultraman.height),
                        const SizedBox(height: 12),
                        _buildProfileRow('Weight', ultraman.weight),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFF2A3D6F), thickness: 1),
                        const SizedBox(height: 24),
                        // Abilities section with Wrap
                        SectionTitle(title: 'Abilities', icon: Icons.star),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildAbilityTag('Speed'),
                            _buildAbilityTag('Strength'),
                            _buildAbilityTag('Energy Control'),
                            _buildAbilityTag('Flight'),
                            _buildAbilityTag('Beam Attack'),
                            _buildAbilityTag('Regeneration'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFF2A3D6F), thickness: 1),
                        const SizedBox(height: 24),
                        // Special Moves section
                        SectionTitle(
                          title: 'Special Moves',
                          icon: Icons.flash_on,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ultraman.specialMove,
                                style: const TextStyle(
                                  color: Color(0xFFFFD700),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                ultraman.specialMoveDescription,
                                style: const TextStyle(
                                  color: Color(0xFFD9E6FF),
                                  fontSize: 14,
                                  height: 1.6,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFF2A3D6F), thickness: 1),
                        const SizedBox(height: 24),
                        // Name image
                        if (ultraman.nameImageUrl.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Hero(
                              tag: '${ultraman.name}_nameImage',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    ultraman.nameImageUrl,
                                    height: 120,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 120,
                                        color: Colors.white.withOpacity(0.05),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFA8BFFF),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbilityTag(String ability) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A7F), Color(0xFF152857)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBFD0FF).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt, size: 14, color: Color(0xFFFFE082)),
          const SizedBox(width: 4),
          Text(
            ability,
            style: const TextStyle(
              color: Color(0xFFBFD0FF),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
