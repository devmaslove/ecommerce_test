import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class TwoColumnTextWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const TwoColumnTextWidget({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftText,
          style: const AppTextStyle().copyWith(
            fontSize: 15,
            height: 19 / 15,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 80,
          child: Text(
            rightText,
            style: const AppTextStyle().copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 19 / 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
