import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/api_service.dart';

class PokemonSearchViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final List<PokemonCard> _results = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String _currentQuery = '';

  List<PokemonCard> get results => _results;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String get currentQuery => _currentQuery;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _results.clear();
      _currentQuery = '';
      _hasMore = false;
      notifyListeners();
      return;
    }

    _currentQuery = query;
    _currentPage = 1;
    _results.clear();
    _hasMore = true;
    
    await loadMore();
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore || _currentQuery.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newResults = await _apiService.fetchCards(
        page: _currentPage,
        pageSize: 20,
        query: _currentQuery,
      );

      // Rule: if results <= 5, don't allow infinite scroll (already loaded all possibly if it's the first page)
      // Actually, the requirement says "if more than 5 then infinite scroll".
      // This usually means if the initial payload is small, we don't expect more.
      // But let's be more precise: if we loaded more than 5, we can potentially load more.
      
      if (newResults.length < 20) {
        _hasMore = false;
      }

      _results.addAll(newResults);
      
      // Additional logic for "if more than 5 then infinite scroll"
      // If we have 5 or less results in total, stop here.
      if (_results.length <= 5) {
        _hasMore = false;
      }

      _currentPage++;
    } catch (e) {
      debugPrint('Error searching cards: $e');
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
