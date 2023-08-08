import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/controllers/question_controller.dart';
import 'package:roomfinding/model/Questions.dart';
import 'package:roomfinding/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.index,
  });

  final Question question;
  final int index;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppColors.kDefaultPadding),
      padding: const EdgeInsets.all(AppColors.kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.kBlackColor),
          ),
          const SizedBox(height: AppColors.kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              key: ValueKey('option_$index'),
              index: index,
              text: question.options[index],
              press: () => controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
