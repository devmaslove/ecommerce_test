import 'package:ecommerce_test/ui/pages/main/widgets/list_categories_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';

class MainPageCategoryLoading extends StatelessWidget {
  final String selectedCategory;

  const MainPageCategoryLoading({
    super.key,
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
              onSelectCategory: null,
            ),
            const SizedBox(height: 12),
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.accent,
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
