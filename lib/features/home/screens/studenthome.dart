import 'dart:async';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/pallete.dart';
import '../../../core/constants/custom_animations/fade_in_animation.dart';
import '../../../widgets/student_drawer.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  bool openNavigationDrawer = true;
  final colorList = <Color>[
    const Color(0xFF0D47A1),
    const Color(0xff004D40),
  ];

  @override
  void initState() {
    super.initState();
  }

  void reloadApiData() {}

  @override
  void dispose() {
    super.dispose();
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: sKey,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
            ),
            child: StudentDrawer(),
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu_sharp,
                  color: Pallete.primaryColor,
                  size: 28,
                ));
          }),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Lab Inventory System",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 216, 205, 205)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_active,
                        color: Pallete.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 1.9,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: ((index, reason) {
                    setState(() => activeIndex = index);
                  }),
                ),
                items: LabEquipmentSliders.getImageSliders(context),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 180,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                    color: Pallete.primaryColor,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Lab Alerts",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    color: Pallete.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ]),
                    ),
                  ),
                  FadeInAnimation(
                    delay: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.3,
                        children: [
                          GridItem(
                            imagePath: 'assets/lab-equipment.png',
                            title: 'Equipment List',
                            onTap: () {},
                          ),
                          GridItem(
                            imagePath: 'assets/check-in.png',
                            title: 'Check In',
                            onTap: () {},
                          ),
                          GridItem(
                            imagePath: 'assets/experiment.png',
                            title: 'Available Items',
                            onTap: () {},
                          ),
                          GridItem(
                            imagePath: 'assets/schedule.png',
                            title: 'Lab Schedule',
                            onTap: () {},
                          ),
                          GridItem(
                            imagePath: 'assets/chemistry-class.png',
                            title: 'My Experiments',
                            onTap: () {},
                          ),
                          GridItem(
                            imagePath: 'assets/analysis.png',
                            title: 'Usage Reports',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class LabEquipmentSliders {
  static List<Widget> getImageSliders(BuildContext context) {
    return [
      _buildSlider(
        title: "Manage Lab Equipment\nEffortlessly",
        subtitle: "Track inventory in real-time",
        buttonText: 'View Inventory',
        imagePath: 'assets/flask.png',
        onPressed: () {},
      ),
      _buildSlider(
        title: "Equipment Checkout\nMade Simple",
        subtitle: "Reserve items with one tap",
        buttonText: 'Checkout Now',
        imagePath: 'assets/check-in.png',
        onPressed: () {},
      ),
      _buildSlider(
        title: "Maintenance Alerts\n& Scheduling",
        subtitle: "Never miss calibration dates",
        buttonText: 'View Schedule',
        imagePath: 'assets/schedule.png',
        onPressed: () {},
      ),
      _buildSlider(
        title: "Usage Analytics\n& Reports",
        subtitle: "Track equipment utilization",
        buttonText: 'Generate Report',
        imagePath: 'assets/analysis.png',
        onPressed: () {},
      ),
      _buildSlider(
        title: "Safety Compliance\nMonitoring",
        subtitle: "Ensure lab safety standards",
        buttonText: 'Check Compliance',
        imagePath: 'assets/measures.png',
        onPressed: () {},
      ),
    ];
  }

  static Widget _buildSlider({
    required String title,
    required String subtitle,
    required String buttonText,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF0D47A1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0D47A1),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          buttonText,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 90,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const GridItem({
    required this.imagePath,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3, left: 3, top: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: Color(0xFF0D47A1),
              width: 1,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE3F2FD),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}