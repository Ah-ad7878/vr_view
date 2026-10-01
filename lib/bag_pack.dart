import 'package:flutter/material.dart';

class BagPack extends StatefulWidget {
  const BagPack({super.key});

  @override
  State<BagPack> createState() => _BagPackState();
}

class _BagPackState extends State<BagPack> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF42382F), Color(0xFF2C251F)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: FractionalTranslation(
                translation: const Offset(0.05, 0),
                child: RotationTransition(
                  turns: _controller,
                  child: Image.asset(
                    'assets/images/bag.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            top: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'NEW IN',
                    style: TextStyle(color: Colors.white70, fontSize: 9),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Backpack',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Jack Wolfskin',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildSizeBadge('M'),
                    const SizedBox(width: 6),
                    _buildSizeBadge('L'),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Column(
              children: [
                _buildThumbnail(Icons.backpack, isSelected: true),
                const SizedBox(height: 8),
                _buildThumbnail(Icons.shopping_bag, isSelected: false),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.chevron_left, color: Colors.white70, size: 18),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeBadge(String text) {
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white38, width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThumbnail(IconData icon, {required bool isSelected}) {
    return Container(
      width: 36,
      height: 46,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE5E3DC) : Colors.black26,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isSelected ? Colors.black : Colors.white54,
      ),
    );
  }
}
