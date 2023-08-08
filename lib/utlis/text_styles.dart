import 'package:flutter/material.dart';
import 'package:roomfinding/constants/app_colors.dart';

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle getTitleStyle() {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 24,
          color: const Color(0xff632B13),
        );
  }

  TextStyle getDescriptionStyle() {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppColors.blackColor,
        );
  }

  TextStyle getRegularStyle() {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          color: const Color(0xff632B13),
        );
  }

  TextStyle getBoldStyle() {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 14,
          color: const Color(0xFFD9D9D9),
        );
  }
}
