import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RarityBadge extends StatelessWidget {
  final String? rarity;
  final bool showIcon;

  const RarityBadge({
    super.key,
    required this.rarity,
    this.showIcon = true,
  });

  IconData _getRarityIcon() {
    if (rarity == null) return Icons.help_outline;

    switch (rarity!.toLowerCase()) {
      case 'common':
        return Icons.circle;
      case 'uncommon':
        return Icons.circle_outlined;
      case 'rare':
      case 'rare holo':
      case 'holo rare':
        return Icons.star;
      case 'ultra rare':
      case 'rare ultra':
        return Icons.star_border_purple500;
      case 'secret rare':
      case 'rare secret':
        return Icons.auto_awesome;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (rarity == null) return const SizedBox.shrink();

    final color = PokemonTheme.getRarityColor(rarity);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(_getRarityIcon(), size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            rarity!,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
