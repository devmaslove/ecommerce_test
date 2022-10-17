import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class ColorButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color color;

  const ColorButtonWidget({
    super.key,
    this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        padding: text != null
            ? const EdgeInsets.symmetric(horizontal: 20)
            : EdgeInsets.zero,
        minimumSize: const Size(37, 37),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: getBodyWidget(),
    );
  }

  Widget? getBodyWidget() {
    if (text != null) {
      return Text(
        text!,
        style: const AppTextStyle().copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );
    }
    return null;
  }
}
