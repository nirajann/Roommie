import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/controllers/navigator_controllers.dart';
import 'package:roomfinding/page/walletscreen.dart';
import 'package:roomfinding/page/home_page.dart';
import 'package:roomfinding/page/profilescreen.dart';
import 'package:roomfinding/quiz/welcome_screen.dart';

class MainNavigator extends StatefulWidget {
   final int totalPoints;
  const MainNavigator({Key? key, required this.totalPoints}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // Screens
  final List<Widget> screens = [
    const HomePage(),
    const WalletScreen(),
    WelcomeScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Controller
    final controller = Get.find<NavigatorController>();
    // if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return SafeArea(
      child: Scaffold(
        /// Screens
        body: GetBuilder<NavigatorController>(
            id: "change NavBar Index",
            builder: (context) {
              return screens[controller.currentIndex];
            }),

        /// bottomNavigationBar
        bottomNavigationBar: GetBuilder<NavigatorController>(
            id: "change NavBar Index",
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: CustomNavigationBar(
                  elevation: 40,
                  iconSize: 30.0,
                  scaleFactor: 0.3,
                  borderRadius: const Radius.circular(20),
                  unSelectedColor: Colors.grey,
                  strokeColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                  selectedColor: Colors.white,
                  isFloating: true,
                  currentIndex: controller.currentIndex,
                  onTap: (index) {
                    controller.changeNavBarIndex(index);
                  },
                  items: [
                    /// Home
                    CustomNavigationBarItem(
                      icon: const Icon(
                        LineIcons.home,
                      ),
                    ),

                    /// Wallet
                    CustomNavigationBarItem(
                      icon: const Icon(
                        LineIcons.wallet,
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(
                        Icons.gamepad_outlined,
                      ),
                    ),

                    /// User Profile
                    CustomNavigationBarItem(
                      icon: const Icon(
                        LineIcons.user,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
    // } else {
    //   return const LandScapeScreen();
    // }
  }
}
