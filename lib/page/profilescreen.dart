// ignore_for_file: must_be_immutable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomfinding/Auth/loginpage.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/page/settingpage.dart';
import 'package:roomfinding/utlis/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'badges.dart';
import 'history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int userPoints;

  @override
  void initState() {
    _getUserPoints();
    super.initState();
  }

  _getUserPoints() async {
    int points = await _getUserPointsFromStorage();
    setState(() {
      userPoints = points;
    });
  }

  Future<int> _getUserPointsFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userPoints') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: mainDrawer(0),
        // appBar: const UserProfileAppBar(),
        body: Column(
          children: [
            const TopUserInfo(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: w,
              height: h / 1.6,
              child: Stack(children: const [
                PrimarySection(),
                BottomSection(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

///Bottom Section Widget Components
class BottomSection extends StatefulWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  _setDataToGetPref(String username, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);
      await prefs.setString("password", password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<String> performances = [
    "Booking History",
    "Badges",
    "Settings",
    "Log Out"
  ];

  List<String> imagePath = [
    'assets/images/his.png',
    'assets/images/badge.png',
    'assets/images/set.png',
    'assets/images/log.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: FadeInUp(
        delay: const Duration(milliseconds: 600),
        child: Container(
          width: w,
          height: h / 2.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: GridView.builder(
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.99,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    index == 4
                        ? Get.to(const SettingPage(),
                            transition: Transition.cupertino)
                        : Container();
                  },
                  child: FadeInUp(
                    delay: Duration(milliseconds: 600 * index ~/ 1.5),
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: unSelectedColor, width: 1.5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              delay: Duration(milliseconds: 650 * index ~/ 1.5),
                              child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset(imagePath[index])),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            FadeInUp(
                                delay: Duration(
                                  milliseconds: 700 * index ~/ 1.5,
                                ),
                                child: TextButton(
                                  child: Text(
                                    performances[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () async {
                                    _setDataToGetPref("", "");
                                    if (performances[index] == "Log Out") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (index) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    } else if (performances[index] ==
                                        "Booking History") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (index) =>
                                              BookingHistoryPage(),
                                        ),
                                      );
                                    } else if (performances[index] ==
                                        "Badges") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (index) =>
                                              AchievementDetailPage(),
                                        ),
                                      );
                                    } else if (performances[index] ==
                                        "Settings") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (index) =>
                                              const SettingPage(),
                                        ),
                                      );
                                    }
                                  },
                                ))
                          ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

///Purple Section Widget Components
class PrimarySection extends StatefulWidget {
  const PrimarySection({
    Key? key,
  }) : super(key: key);

  @override
  State<PrimarySection> createState() => _PrimarySectionState();
}

class _PrimarySectionState extends State<PrimarySection> {
  late Future<int> userPointsFuture;

  @override
  void initState() {
    userPointsFuture = _getUserPoints();
    super.initState();
  }

  Future<int> _getUserPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userPoints') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: userPointsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasError) {
          return const Text('Error fetching user points'); // Error handling
        } else {
          int userPoints = snapshot.data ?? 0;

          return FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Container(
              width: w, // Replace with your desired width
              height: h / 5, // Replace with your desired height
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ComponentsOfPrimarySection(
                    title: Text(
                      "5",
                      style: GoogleFonts.oxygen(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: "badges",
                  ),
                  ComponentsOfPrimarySection(
                    title: Text(
                      "10 Room",
                      style: GoogleFonts.oxygen(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: "Boooked",
                  ),
                  ComponentsOfPrimarySection(
                    title: Text(
                      "$userPoints",
                      style: GoogleFonts.oxygen(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: "Points",
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

/// Components of Purple Section Widget Components
class ComponentsOfPrimarySection extends StatelessWidget {
  Text title;
  String subtitle;
  //
  ComponentsOfPrimarySection(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: w / 3.7,
        height: h / 7.3,
        decoration: BoxDecoration(
            color: unSelectedColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              delay: const Duration(milliseconds: 450),
              child: title,
            ),
            const SizedBox(
              height: 5,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Text(subtitle,
                  style: const TextStyle(color: unSelectedColor, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Top User Section Info Widget Components
class TopUserInfo extends StatelessWidget {
  const TopUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: w,
          height: h / 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/main.png")),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nirajan Gautam",
                    style: GoogleFonts.oxygen(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Mid Level Flutter Developer",
                    style: GoogleFonts.oxygen(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
