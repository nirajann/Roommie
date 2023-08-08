import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomfinding/Auth/loginpage.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/utlis/constants.dart';

class SplashPageScreen extends StatefulWidget {
  const SplashPageScreen({Key? key}) : super(key: key);

  @override
  State<SplashPageScreen> createState() => _SplashPageScreenState();
}

class _SplashPageScreenState extends State<SplashPageScreen> {
  // _getDataFromSharedPref() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? username = prefs.getString("username");
  //   if (username == "") {
  //     Get.offAll(() => const LoginScreen(), transition: Transition.cupertino);
  //   } else {
  //     Get.offAll(() => const MainNavigator(), transition: Transition.cupertino);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      // await _getDataFromSharedPref();
      Get.offAll(() => const LoginScreen(), transition: Transition.cupertino);
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: w,
          height: h,
          child: Stack(children: [
            FadeInDown(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: w,
                height: h / 2,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000))),
              ),
            ),
            Positioned(
              top: 90,
              left: 60,
              child: FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: w / 1.5,
                  height: h / 10,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome To\n',
                            style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'ON',
                            style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: 'Kathmandu',
                            style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 60,
              child: FadeInUp(
                delay: const Duration(milliseconds: 700),
                child: SizedBox(
                  width: w / 1.5,
                  height: h / 10,
                  child: Center(
                    child: Text(
                      "FInd Room",
                      style: GoogleFonts.lato(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 135,
              child: FadeInUp(
                delay: const Duration(milliseconds: 900),
                child: Spin(
                  delay: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    width: w / 3,
                    height: h / 6,
                    child: Center(child: Image.asset('assets/images/logo.png')),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 80,
              child: FadeInUp(
                delay: const Duration(milliseconds: 1300),
                child: SizedBox(
                  width: w / 1.6,
                  height: h / 19,
                  child: Center(
                    child: Text(
                      "Wait Few Moment....",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 155,
              child: FadeInUp(
                delay: const Duration(milliseconds: 1500),
                child: SizedBox(
                  width: w / 5,
                  height: h / 15,
                  child: Center(
                      child: SpinKitFoldingCube(
                    size: 35,
                    itemBuilder: (BuildContext context, int index) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
    // } else {
    //   return const LandScapeScreen();
    // }
  }
}
