import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  final String title;
  final String? buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onPressed;

  const ListTitleWidget({
    super.key,
    required this.title,
    this.buttonText,
    this.buttonIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const AppTextStyle().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.dark,
          ),
        ),
        const Spacer(),
        if (buttonText != null || buttonIcon != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (buttonIcon != null)
                  Icon(
                    buttonIcon,
                    size: 16,
                    color: AppColors.accent,
                  ),
                if (buttonIcon != null && buttonText != null)
                  const SizedBox(width: 4),
                if (buttonText != null)
                  Text(
                    buttonText!,
                    style: const AppTextStyle().copyWith(
                      fontSize: 15,
                      height: 16 / 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.accent,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
