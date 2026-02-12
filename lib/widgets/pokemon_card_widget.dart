import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../views/detail_page.dart';
import '../theme/app_theme.dart';
import '../widgets/rarity_badge.dart';
import '../widgets/type_chip.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonCard card;

  const PokemonCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final isRare = card.rarity != null &&
        (card.rarity!.toLowerCase().contains('rare') ||
            card.rarity!.toLowerCase().contains('ultra') ||
            card.rarity!.toLowerCase().contains('secret'));

    return Card(
      elevation: 4,
      shadowColor: isRare
          ? PokemonColors.pokemonYellowShadow.withOpacity(0.4)
          : Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isRare
            ? BorderSide(
                color: PokemonColors.pokemonYellowShadow,
                width: 2,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(card: card),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Section
            Expanded(
              child: Stack(
                children: [
                  // Card Image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      color: Colors.grey[100],
                    ),
                    child: Hero(
                      tag: 'pokemon-${card.id}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          card.images?.small ?? '',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                                color: PokemonColors.pokemonBlue,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Rarity Badge (Top Right)
                  if (card.rarity != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: RarityBadge(
                        rarity: card.rarity,
                        showIcon: false,
                      ),
                    ),
                ],
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Name
                  Text(
                    card.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PokemonColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // Types and HP
                  Row(
                    children: [
                      if (card.types != null && card.types!.isNotEmpty)
                        Expanded(
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: card.types!
                                .take(2)
                                .map((type) => TypeChip(
                                      type: type,
                                      small: true,
                                    ))
                                .toList(),
                          ),
                        ),
                      if (card.hp != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: PokemonColors.pokemonRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: PokemonColors.pokemonRed,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${card.hp} HP',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: PokemonColors.pokemonRed,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  // Set Info
                  if (card.set != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      card.set!.name,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
