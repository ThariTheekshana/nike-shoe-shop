// provider/cart_provider.dart
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier{
  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

    void toggleCart(Map<String, dynamic> shoe) {
    if (_cart.any((item) => item['imagePath'] == shoe['imagePath'])) {
      _cart.removeWhere((item) => item['imagePath'] == shoe['imagePath']);
    } else {
      _cart.add(shoe);
    }
    notifyListeners();
  }

    void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

 void increaseQuantity(int index) {
  if (index >= 0 && index < _cart.length) {
    _cart[index]['quantity'] = (_cart[index]['quantity'] ?? 1) + 1;
    notifyListeners();
  }
}

void decreaseQuantity(int index) {
  if (index >= 0 && index < _cart.length) {
    if (_cart[index]['quantity'] == null) {
      _cart[index]['quantity'] = 1; // Ensure default value
    } else if (_cart[index]['quantity']! > 1) {
      _cart[index]['quantity'] = _cart[index]['quantity']! - 1;
    }
    notifyListeners();
  }
}

double getTotalPriceEachShoe(int index) {
  if (index >= 0 && index < _cart.length) {
    double price = _cart[index]['price'] ?? 0.0;
    int quantity = _cart[index]['quantity'] ?? 1;
    return price * quantity;
  }
  return 0.0;
}

double getTotalPriceAllShoes() {
  double total = 0.0;
  for (var item in _cart) {
    double price = item['price'] ?? 0.0;
    int quantity = item['quantity'] ?? 1;
    total += price * quantity;
  }
  return total;
}

double calculateDeliveryFee(double totalPrice) {
  return (totalPrice / 100).floor() * 7;
}


double calculateTotalCostWithDelivery() {
  double totalPrice = getTotalPriceAllShoes();
  double deliveryFee = calculateDeliveryFee(totalPrice);
  return totalPrice + deliveryFee;
}





}
