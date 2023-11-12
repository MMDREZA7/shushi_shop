import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushy_market/components/button.dart';
import 'package:sushy_market/constans.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeryColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // shop name
            Text(
              'SushiMan',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            // icon
            Container(
              padding: const EdgeInsets.all(30),
              child: Image.asset('images/sushi (4).png'),
            ),
            // title
            Text(
              'The Taste of japanese Food',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            // subtitle
            Text(
              'Feel the tastle of your popular Japanese food from anywhere',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[400],
                height: 2,
              ),
            ),
            const SizedBox(height: 25),
            // get started button
            MyButton(
              text: 'Get Started',
              ontap: () {
                Navigator.pushNamed(
                  context,
                  '/menuPage',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
