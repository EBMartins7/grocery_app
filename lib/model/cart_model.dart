import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    ['Apple', '4.00', 'img/apple.jpg', Colors.green],
    ['Avocado', '10.00', 'img/avocado.jpg', Colors.blue],
    ['Banana', '2.50', 'img/banana.jpg', Colors.indigo],
    ['Bread', '7.00', 'img/bread.jpg', Colors.redAccent],
    ['Chicken', '15.00', 'img/chicken.jpg', Colors.brown],
    ['Water', '1.00', 'img/water.jpg', Colors.yellow],
  ];

  //list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add items to cart
  void addItemsToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
