import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/utils/pallete.dart';
import '../core/constants/general_assets.dart';


class StudentDrawer extends StatefulWidget {
  const StudentDrawer({super.key});

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
        Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.32,
        child: DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to student profile
                },
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.18,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-5, -5),
                        blurRadius: 15,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://cdn-icons-png.flaticon.com/128/3177/3177440.png',
                      placeholder: (context, url) => Skeletonizer(
                        enabled: true,
                        child: Image.asset('assets/blueProfileImage.png'),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.person, size: 60),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      'Sarah Johnson',
                      style: TextStyle(
                        fontSize: 16,
                        color: Pallete.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Computer Science - Year 3',
                      style: TextStyle(
                        fontSize: 12,
                        color: Pallete.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    // Lab Schedule
    ListTile(
    leading: Icon(Icons.calendar_today, color: Pallete.primaryColor),
    title: const Text('Lab Schedule'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // Upcoming Labs
    ListTile(
    leading: Icon(FontAwesomeIcons.flask, color: Pallete.primaryColor),
    title: const Text('Upcoming Labs'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // My Submissions
    ListTile(
    leading: Icon(Icons.assignment, color: Pallete.primaryColor),
    title: const Text('My Submissions'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // Lecture Notes
    ListTile(
    leading: Icon(Icons.note, color: Pallete.primaryColor),
    title: const Text('Lecture Notes'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // FAQ
    ListTile(
    leading: Icon(FontAwesomeIcons.question, color: Pallete.primaryColor),
    title: const Text('Lab FAQ'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // Settings
    ListTile(
    leading: Icon(Icons.settings, color: Pallete.primaryColor),
    title: const Text('Settings'),
    trailing: const Icon(Icons.navigate_next),
    ),

    // Logout
    ListTile(
    leading: const Icon(Icons.logout, color: Colors.redAccent),
    title: const Text('Logout', style: TextStyle(color: Colors.redAccent)),
    trailing: const Icon(Icons.navigate_next),
    onTap: () async {

    },
    ),
    ],
    ),
    );
    }
}