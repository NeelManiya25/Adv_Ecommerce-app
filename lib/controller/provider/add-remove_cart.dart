import 'package:flutter/material.dart';

import '../../modal/api_modal.dart';

class CartProvider extends ChangeNotifier {
  List<FakeStoreData> _cartItems = [];

  List<FakeStoreData> get cartItems => _cartItems;

  void addToCart(FakeStoreData item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(FakeStoreData item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
