import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/quiz/quiz_screen.dart';
import 'package:roomfinding/utlis/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Stack(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppColors.kDefaultPadding + 2),
                child: PurpleSection()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppColors.kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2), //2/6
                    Center(
                      child: Text(
                        "Let's Play Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Get.to(QuizScreen()),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(
                            AppColors.kDefaultPadding * 0.75), // 15
                        decoration: const BoxDecoration(
                          gradient: AppColors.kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Lets Start Quiz",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PurpleSection extends StatelessWidget {
  const PurpleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h / 4,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ComponentsOfPurpleSection(
            title: Text(
              "50",
              style: GoogleFonts.oxygen(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            subtitle: "points",
          ),
          ComponentsOfPurpleSection(
            title: Text(
              "10",
              style: GoogleFonts.oxygen(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            subtitle: "Total Quiz",
          ),
          ComponentsOfPurpleSection(
            title: Text(
              "30",
              style: GoogleFonts.oxygen(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            subtitle: "correct answer",
          ),
        ],
      ),
    );
  }
}

class ComponentsOfPurpleSection extends StatelessWidget {
  Text title;
  String subtitle;
  //
  ComponentsOfPurpleSection(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: w / 3.7,
      height: h / 6,
      decoration: BoxDecoration(
          color: unSelectedColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title,
          const SizedBox(
            height: 5,
          ),
          Text(subtitle,
              style: const TextStyle(color: unSelectedColor, fontSize: 16)),
        ],
      ),
    );
  }
}
