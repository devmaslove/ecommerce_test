import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppImages.filter,
              width: 11,
              height: 13,
            ),
            tooltip: 'Open filter',
            onPressed: () {},
          ),
          const SizedBox(width: 17),
        ],
      ),
      body: ListView(
        children: [
          ListTitleWidget(
            title: 'Select Category',
            buttonText: 'view all',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const ListTitleWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
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
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
          child: Text(
            buttonText,
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
