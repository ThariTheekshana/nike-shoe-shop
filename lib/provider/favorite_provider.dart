// provider/favorite_provider.dart
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(Map<String, dynamic> shoe) {
    if (_favorites.any((item) => item['imagePath'] == shoe['imagePath'])) {
      _favorites.removeWhere((item) => item['imagePath'] == shoe['imagePath']);
    } else {
      _favorites.add(shoe);
    }
    notifyListeners();
  }
}
