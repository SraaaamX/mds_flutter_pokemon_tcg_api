import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../viewmodels/pokemon_explore_viewmodel.dart';
import '../widgets/pokemon_card_widget.dart';
import '../widgets/loading_pokeball.dart';
import '../theme/app_theme.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonExploreViewModel>().loadInitialCards();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PokemonExploreViewModel>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explorer les Pokémons'), elevation: 2),
      drawer: const AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              PokemonColors.pokemonBlue.withOpacity(0.05),
              PokemonColors.backgroundLight,
            ],
          ),
        ),
        child: Consumer<PokemonExploreViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading && viewModel.cards.isEmpty) {
              return const Center(child: LoadingPokeball(size: 60));
            }

            if (viewModel.cards.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.catching_pokemon,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Aucune carte trouvée',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: viewModel.refresh,
              color: PokemonColors.pokemonBlue,
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: viewModel.cards.length + (viewModel.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == viewModel.cards.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: LoadingPokeball(size: 40),
                      ),
                    );
                  }
                  return PokemonCardWidget(card: viewModel.cards[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
