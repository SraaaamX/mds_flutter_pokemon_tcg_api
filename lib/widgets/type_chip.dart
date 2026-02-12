import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TypeChip extends StatelessWidget {
  final String type;
  final bool small;

  const TypeChip({
    super.key,
    required this.type,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = PokemonTheme.getTypeColor(type);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 8,
        vertical: small ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          fontSize: small ? 10 : 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
