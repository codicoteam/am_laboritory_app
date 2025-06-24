
import 'package:flutter/material.dart';

import '../../../../core/constants/general_assets.dart';
import '../../../../core/utils/pallete.dart';


class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key, }) : super(key: key);


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
              Assets.intro5, // Replace this with the path to your image
              fit: BoxFit.fill,
              height: 350,
            ),Text(
        'Manage your lab schedules and submissions efficiently.',
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