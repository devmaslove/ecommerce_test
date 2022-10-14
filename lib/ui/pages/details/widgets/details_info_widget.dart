import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class DetailsInfoWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const DetailsInfoWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppColors.dark.withOpacity(0.3),
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const AppTextStyle().copyWith(
            fontSize: 11,
            height: 14 / 11,
            fontWeight: FontWeight.w400,
            color: AppColors.dark.withOpacity(0.3),
            letterSpacing: null,
          ),
        )
      ],
    );
  }
}
