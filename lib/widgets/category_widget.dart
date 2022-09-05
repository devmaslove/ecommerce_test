import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final String? imageAssetName;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback onPressed;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.selected,
    this.imageAssetName,
    this.imageWidth,
    this.imageHeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
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
                width: 71,
                height: 71,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.accent : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: imageAssetName != null &&
                        imageWidth != null &&
                        imageHeight != null
                    ? SvgPicture.asset(
                        imageAssetName!,
                        width: imageWidth!,
                        height: imageHeight!,
                        color: selected
                            ? Colors.white
                            : AppColors.dark.withOpacity(0.3),
                      )
                    : null,
              ),
              const SizedBox(height: 7),
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
