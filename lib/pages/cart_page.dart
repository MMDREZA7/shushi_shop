import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushy_market/components/button.dart';
import 'package:sushy_market/constans.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primeryColor,
        appBar: AppBar(
          backgroundColor: primeryColor,
          centerTitle: true,
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            // CUSTOMER CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];

                  // get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price.toString();

                  // get food image
                  final String imagepath = food.imagePath;

                  // return list tile
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 142, 81, 77),
                    ),
                    child: ListTile(
                      // food image
                      leading: Image.asset(
                        imagepath,
                        height: 50,
                      ),

                      // food name
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      // food price
                      subtitle: Text(
                        foodPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          removeFromCart(food, context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(text: 'Pay Now', ontap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
