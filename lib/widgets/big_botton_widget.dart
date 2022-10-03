import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class BigButtonWidget extends StatelessWidget {
  final String text;
  final String textRight;
  final VoidCallback onPressed;

  const BigButtonWidget({
    super.key,
    required this.text,
    this.textRight = '',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.accent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 38),
        minimumSize: const Size(double.infinity, 54),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const AppTextStyle().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          if (textRight.isNotEmpty) const Spacer(),
          if (textRight.isNotEmpty)
            Text(
              textRight,
              style: const AppTextStyle().copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
