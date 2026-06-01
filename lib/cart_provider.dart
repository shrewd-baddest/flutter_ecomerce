import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
