import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? ontap;
  const FoodTile({
    super.key,
    required this.food,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 25),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Image.asset(
              food.imagePath,
              height: 140,
            ),

            // text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
              ),
            ),

            // price + Rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // price
                  Text(food.price),

                  // rating
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                  ),

                  Text(food.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
