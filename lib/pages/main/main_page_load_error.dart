import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';

class MainPageLoadError extends StatelessWidget {
  final VoidCallback onRetry;

  const MainPageLoadError({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Failed to load data',
                style: const AppTextStyle().copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              BigButtonWidget(
                text: 'Retry',
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
