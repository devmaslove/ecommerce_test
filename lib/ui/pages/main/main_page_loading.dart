import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class MainPageLoading extends StatelessWidget {
  const MainPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Center(
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    width: 132,
                    height: 132,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    left: 34,
                    top: 32,
                    child: Text(
                      'Ecommerce Concept'.replaceAll(' ', '\n'),
                      style: const AppTextStyle().copyWith(
                        color: Colors.white,
                        fontSize: 30,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
