import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final IconData icon;
  final VoidCallback? onPressed;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.selected,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      color: AppColors.background,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.accent : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dark.withOpacity(0.1),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color:
                      selected ? Colors.white : AppColors.dark.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const AppTextStyle().copyWith(
                  color: selected ? AppColors.accent : AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
