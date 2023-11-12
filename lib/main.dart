import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushy_market/models/shop.dart';
import 'package:sushy_market/pages/cart_page.dart';
import 'package:sushy_market/pages/intro_page.dart';
import 'package:sushy_market/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        '/introPage': (context) => const IntroPage(),
        '/menuPage': (context) => const MenuPage(),
        '/cartPage': (context) => const CartPage(),
      },
    );
  }
}
