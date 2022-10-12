import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  final String title;
  final String? buttonText;
  final VoidCallback? onPressed;

  const ListTitleWidget({
    super.key,
    required this.title,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 17),
        Text(
          title,
          style: const AppTextStyle().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        if (buttonText != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
            ),
            child: Text(
              buttonText!,
              style: const AppTextStyle().copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.accent,
              ),
            ),
          ),
        const SizedBox(width: 17),
      ],
    );
  }
}
