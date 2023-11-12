import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushy_market/components/button.dart';
import 'package:sushy_market/models/food_tile.dart';
import 'package:sushy_market/models/shop.dart';
import 'package:sushy_market/constans.dart';
import 'package:sushy_market/pages/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details page
  void navigateToFoodItemDetails(int index) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[800],
        actions: [
          // cart Button
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartPage');
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
        ],
        centerTitle: true,
        leading: const Icon(Icons.menu, color: Colors.black, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tokyo',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo banner
            Container(
              decoration: BoxDecoration(
                color: primeryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // promo message
                  Column(
                    children: [
                      Text(
                        'Get 32% promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 18,
                          color: Colors.redAccent[100],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // redeem butotn
                      MyButton(
                        text: 'Redeem',
                        ontap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  //  image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset(
                      'images/sushi.png',
                    ),
                  ),
                ],
              ),
            ),

            // search bar
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextField(
                cursorColor: Colors.black,
                cursorHeight: 25,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // menu list
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Foods Menu',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // popular foods
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  ontap: () => navigateToFoodItemDetails(index),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // promo banner
                Container(
                  decoration: BoxDecoration(
                    color: primeryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // image
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'images/sushi (1).png',
                        ),
                      ),

                      // promo message
                      Column(
                        children: [
                          Text(
                            'Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$ 10.00',
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                              ),
                              Text(
                                '4.9',
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          // redeem butotn
                        ],
                      ),
                      const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
