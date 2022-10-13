import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class ListCategoriesWidget extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;
  final EdgeInsetsGeometry padding;

  const ListCategoriesWidget({
    super.key,
    required this.selectedCategory,
    required this.onSelectCategory,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            CategoryWidget(
              title: 'Phones',
              selected: selectedCategory == 'Phones',
              icon: BootstrapIcons.phone,
              onPressed: () => onSelectCategory('Phones'),
            ),
            CategoryWidget(
              title: 'Computer',
              selected: selectedCategory == 'Computer',
              icon: BootstrapIcons.pc_display,
              onPressed: () => onSelectCategory('Computer'),
            ),
            CategoryWidget(
              title: 'Health',
              selected: selectedCategory == 'Health',
              icon: BootstrapIcons.heart_pulse,
              onPressed: () => onSelectCategory('Health'),
            ),
            CategoryWidget(
              title: 'Books',
              selected: selectedCategory == 'Books',
              icon: BootstrapIcons.book,
              onPressed: () => onSelectCategory('Books'),
            ),
            CategoryWidget(
              title: 'Gifts',
              selected: selectedCategory == 'Other',
              icon: BootstrapIcons.gift,
              onPressed: () => onSelectCategory('Other'),
            ),
          ],
        ),
      ),
    );
  }
}
