import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PokemonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isSecondary;

  const PokemonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary
            ? PokemonColors.pokemonBlue
            : PokemonColors.pokemonYellow,
        foregroundColor:
            isSecondary ? Colors.white : PokemonColors.textPrimary,
        elevation: 4,
        shadowColor: isSecondary
            ? PokemonColors.pokemonBlue.withOpacity(0.5)
            : PokemonColors.pokemonYellowShadow,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
