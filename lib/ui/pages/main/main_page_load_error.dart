import 'package:ecommerce_test/ui/pages/main/widgets/list_categories_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:ecommerce_test/ui/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';

class MainPageLoadError extends StatelessWidget {
  final String selectedCategory;
  final VoidCallback onRetry;
  final ValueChanged<String> onSelectCategory;

  const MainPageLoadError({
    super.key,
    required this.onRetry,
    required this.onSelectCategory,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            ListCategoriesWidget(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              selectedCategory: selectedCategory,
              onSelectCategory: onSelectCategory,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Failed to load data',
                        style: const AppTextStyle().copyWith(
                          fontSize: 20,
                          color: AppColors.dark,
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
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
