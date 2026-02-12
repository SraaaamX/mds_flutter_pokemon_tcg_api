import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/api_service.dart';

class PokemonExploreViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final List<PokemonCard> _cards = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  List<PokemonCard> get cards => _cards;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> loadInitialCards() async {
    if (_cards.isNotEmpty) return;
    await loadMore();
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newCards = await _apiService.fetchCards(page: _currentPage, pageSize: 20);
      if (newCards.length < 20) {
        _hasMore = false;
      }
      _cards.addAll(newCards);
      _currentPage++;
    } catch (e) {
      debugPrint('Error loading exploration cards: $e');
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _cards.clear();
    _currentPage = 1;
    _hasMore = true;
    await loadMore();
  }
}
