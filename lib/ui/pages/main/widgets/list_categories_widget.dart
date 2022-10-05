import 'package:ecommerce_test/ui/pages/main/widgets/category_widget.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class ListCategoriesWidget extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;

  const ListCategoriesWidget({
    super.key,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: Row(
          children: [
            CategoryWidget(
              title: 'Phones',
              selected: selectedCategory == 'Phones',
              imageAssetName: AppImages.phones,
              imageWidth: 19,
              imageHeight: 30,
              onPressed: () => onSelectCategory('Phones'),
            ),
            CategoryWidget(
              title: 'Computer',
              selected: selectedCategory == 'Computer',
              imageAssetName: AppImages.computer,
              imageWidth: 29,
              imageHeight: 31,
              onPressed: () => onSelectCategory('Computer'),
            ),
            CategoryWidget(
              title: 'Health',
              selected: selectedCategory == 'Health',
              imageAssetName: AppImages.health,
              imageWidth: 32,
              imageHeight: 30,
              onPressed: () => onSelectCategory('Health'),
            ),
            CategoryWidget(
              title: 'Books',
              selected: selectedCategory == 'Books',
              imageAssetName: AppImages.books,
              imageWidth: 21,
              imageHeight: 29,
              onPressed: () => onSelectCategory('Books'),
            ),
            CategoryWidget(
              title: 'Other',
              selected: selectedCategory == 'Other',
              onPressed: () => onSelectCategory('Other'),
            ),
          ],
        ),
      ),
    );
  }
}
