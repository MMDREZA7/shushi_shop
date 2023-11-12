import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
      name: 'Salmon Sushi',
      price: '\$ 21.00',
      imagePath: 'images/sushi (4).png',
      rating: '4.5',
    ),

    // Sushi
    Food(
      name: 'Sushi',
      price: '\$ 26.00',
      imagePath: 'images/sushi (3).png',
      rating: '3.2',
    ),

    // tuna
    Food(
      name: 'tuna',
      price: '\$ 30.00',
      imagePath: 'images/sushi (2).png',
      rating: '3.0',
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // geter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);

      notifyListeners();
    }
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
