import 'package:flutter/material.dart';
import '../../../../core/constants/general_assets.dart';
import '../../../../core/utils/pallete.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key,}) : super(key: key);


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
              Assets.intro3, // Replace this with the path to your image
              fit: BoxFit.fill,
              height: 350,
            ),

            Text(
              'Access lab schedules and experiments anytime, anywhere.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Pallete.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}