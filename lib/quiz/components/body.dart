import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/controllers/question_controller.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppColors.kDefaultPadding),
                child: ProgressBar(
                  key: ValueKey('myBody'),
                ),
              ),
              const SizedBox(height: AppColors.kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppColors.kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: AppColors.kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: AppColors.kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: AppColors.kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateTheQnNum,
                  itemCount: questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    index: index,
                    question: questionController.questions[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
