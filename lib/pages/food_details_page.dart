import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushy_market/components/button.dart';
import 'package:sushy_market/constans.dart';

import '../models/shop.dart';
import '../models/food.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  // quantity
  int quantityCount = 0;

  // decreament quantity
  void decreamentQuantity() {
    if (quantityCount > 0) {
      setState(() {
        quantityCount--;
      });
    }
  }

  // increament quantity
  void increamentQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there something is in the cart
    if (quantityCount > 0) {
      // get the access the shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);
    }

    // let the user know it was successful
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: primeryColor,
        content: const Text(
          'successfully added to cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // okey button
          IconButton(
            onPressed: () {
              // pop once to remove dialog box
              Navigator.pop(context);

              // pop again to previus screen
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.done,
              color: Colors.green[500],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // listVewi of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 160,
                  ),

                  const SizedBox(height: 10),
                  // rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'Delicate Sliced, fresh salmon drapes elegantly ower a pillow of perfectly seasoned sushi rice. The first time you see the contents of the contents  of the contents of the contents of the    contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents of the contents and remove the contents of the contents of the contents of the contents of the contents of why do you think for this moment that you think for this moment how do you think for this moment in output. How do you think for this moment in output and what do you think for the contents of the  this moment in output and what do you think for end const contractor for this shop in here in and of there cow lamborginy in street.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500],
                    ),
                  ),

                  // price + quantity + add to cart button
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: primeryColor,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decreamentQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // quantity count
                        Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: increamentQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // add to cart button
                MyButton(text: 'Add to Cart', ontap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
