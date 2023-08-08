import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/controllers/question_controller.dart';
import 'package:roomfinding/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Future<int> _getUserPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userPoints') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: AppColors.kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${qnController.correctAns * 10}/${qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.kSecondaryColor),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                  onPressed: () async {
                    int totalPoints = await _getUserPoints();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainNavigator(
                                  totalPoints: totalPoints,
                                )));
                  },
                  child: const Text("Go to Home"))
            ],
          )
        ],
      ),
    );
  }
}
