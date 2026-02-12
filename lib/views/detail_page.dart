import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../theme/app_theme.dart';
import '../widgets/rarity_badge.dart';
import '../widgets/type_chip.dart';

class DetailPage extends StatelessWidget {
  final PokemonCard card;

  const DetailPage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Hero Image
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            expandedHeight: 450,
            pinned: true,
            backgroundColor: PokemonColors.pokemonBlue,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                card.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 8.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Gradient Background
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          PokemonColors.pokemonBlue,
                          PokemonColors.pokemonLightBlue,
                        ],
                      ),
                    ),
                  ),
                  // Card Image
                  Hero(
                    tag: 'pokemon-${card.id}',
                    child: card.images != null
                        ? Image.network(
                            card.images!.large,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 100,
                                  color: Colors.white54,
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 100,
                              color: Colors.white54,
                            ),
                          ),
                  ),
                  // Gradient Overlay at bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            PokemonColors.pokemonBlue.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              color: PokemonColors.backgroundLight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Basic Info Card
                    _InfoCard(
                      title: 'Informations générales',
                      icon: Icons.info_outline,
                      children: [
                        if (card.supertype != null)
                          _InfoRow(
                            label: 'Supertype',
                            value: card.supertype!,
                          ),
                        if (card.subtypes != null && card.subtypes!.isNotEmpty)
                          _InfoRow(
                            label: 'Sous-types',
                            value: card.subtypes!.join(', '),
                          ),
                        if (card.hp != null)
                          _InfoRow(
                            label: 'HP',
                            value: card.hp!,
                            valueColor: PokemonColors.pokemonRed,
                          ),
                        if (card.types != null && card.types!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 120,
                                  child: Text(
                                    'Types:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: card.types!
                                        .map((type) => TypeChip(type: type))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (card.rarity != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 120,
                                  child: Text(
                                    'Rareté:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                RarityBadge(rarity: card.rarity),
                              ],
                            ),
                          ),
                        if (card.artist != null)
                          _InfoRow(label: 'Artiste', value: card.artist!),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Set Info
                    if (card.set != null)
                      _InfoCard(
                        title: 'Collection',
                        icon: Icons.collections_bookmark,
                        children: [
                          _InfoRow(label: 'Nom', value: card.set!.name),
                          _InfoRow(label: 'Série', value: card.set!.series),
                          if (card.number != null)
                            _InfoRow(
                              label: 'Numéro',
                              value:
                                  '${card.number}/${card.set!.printedTotal}',
                            ),
                          _InfoRow(
                            label: 'Date de sortie',
                            value: card.set!.releaseDate,
                          ),
                        ],
                      ),
                    const SizedBox(height: 16),

                    // Abilities
                    if (card.abilities != null && card.abilities!.isNotEmpty)
                      _InfoCard(
                        title: 'Capacités',
                        icon: Icons.auto_awesome,
                        children: card.abilities!
                            .map((ability) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: PokemonColors.pokemonLightBlue
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: PokemonColors.pokemonLightBlue
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.stars,
                                              size: 16,
                                              color:
                                                  PokemonColors.pokemonLightBlue,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              ability.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color:
                                                    PokemonColors.pokemonBlue,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: PokemonColors
                                                    .pokemonLightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                ability.type,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          ability.text,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),

                    // Attacks
                    if (card.attacks != null && card.attacks!.isNotEmpty)
                      _InfoCard(
                        title: 'Attaques',
                        icon: Icons.flash_on,
                        children: card.attacks!
                            .map((attack) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: PokemonColors.pokemonRed
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: PokemonColors.pokemonRed
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.flash_on,
                                                    size: 16,
                                                    color: PokemonColors
                                                        .pokemonRed,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Expanded(
                                                    child: Text(
                                                      attack.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: PokemonColors
                                                            .pokemonRed,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (attack.damage.isNotEmpty)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      PokemonColors.pokemonRed,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  attack.damage,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (attack.cost.isNotEmpty) ...[
                                          const SizedBox(height: 6),
                                          Wrap(
                                            spacing: 4,
                                            children: attack.cost
                                                .map((type) => TypeChip(
                                                      type: type,
                                                      small: true,
                                                    ))
                                                .toList(),
                                          ),
                                        ],
                                        if (attack.text.isNotEmpty) ...[
                                          const SizedBox(height: 6),
                                          Text(
                                            attack.text,
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),

                    // Weaknesses & Resistances
                    if ((card.weaknesses != null &&
                            card.weaknesses!.isNotEmpty) ||
                        (card.resistances != null &&
                            card.resistances!.isNotEmpty))
                      _InfoCard(
                        title: 'Faiblesses & Résistances',
                        icon: Icons.shield,
                        children: [
                          if (card.weaknesses != null &&
                              card.weaknesses!.isNotEmpty)
                            _InfoRow(
                              label: 'Faiblesses',
                              value: card.weaknesses!
                                  .map((w) => '${w.type} ${w.value}')
                                  .join(', '),
                              valueColor: PokemonColors.pokemonRed,
                            ),
                          if (card.resistances != null &&
                              card.resistances!.isNotEmpty)
                            _InfoRow(
                              label: 'Résistances',
                              value: card.resistances!
                                  .map((r) => '${r.type} ${r.value}')
                                  .join(', '),
                              valueColor: Colors.green[700],
                            ),
                        ],
                      ),

                    // Market Price
                    if (card.cardmarket?.prices != null)
                      _InfoCard(
                        title: 'Prix du marché',
                        icon: Icons.euro,
                        children: [
                          if (card.cardmarket!.prices.trendPrice != null)
                            _InfoRow(
                              label: 'Prix tendance',
                              value:
                                  '${card.cardmarket!.prices.trendPrice!.toStringAsFixed(2)} €',
                              valueColor: PokemonColors.pokemonYellowShadow,
                            ),
                          if (card.cardmarket!.prices.averageSellPrice != null)
                            _InfoRow(
                              label: 'Prix moyen',
                              value:
                                  '${card.cardmarket!.prices.averageSellPrice!.toStringAsFixed(2)} €',
                            ),
                          if (card.cardmarket!.prices.lowPrice != null)
                            _InfoRow(
                              label: 'Prix bas',
                              value:
                                  '${card.cardmarket!.prices.lowPrice!.toStringAsFixed(2)} €',
                            ),
                        ],
                      ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: PokemonColors.pokemonBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: PokemonColors.pokemonBlue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: PokemonColors.pokemonBlue,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: valueColor ?? Colors.grey[700],
                fontWeight:
                    valueColor != null ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
