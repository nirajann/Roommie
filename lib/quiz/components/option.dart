import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    required Key key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return AppColors.kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return AppColors.kRedColor;
              }
            }
            return AppColors.kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == AppColors.kRedColor
                ? Icons.close
                : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: AppColors.kDefaultPadding),
              padding: const EdgeInsets.all(AppColors.kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == AppColors.kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == AppColors.kGrayColor
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
