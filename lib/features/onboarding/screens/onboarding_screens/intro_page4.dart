import 'package:anesu_library_app/core/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/intro3.png', // Replace this with the correct path to your image asset
              fit: BoxFit.fill,
              height: 350,
            ),
            Text(
              'Expert academic guidance for your laboratory success.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Pallete.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}