import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class BestSellerWidget extends StatelessWidget {
  final String picture;
  final bool isFavorite;
  final String title;
  final String price;
  final String discountPrice;
  final VoidCallback onTap;

  const BestSellerWidget({
    super.key,
    required this.picture,
    required this.isFavorite,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: AppColors.dark.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            height: 168,
            width: 184,
            child: Image.network(
              picture,
              fit: BoxFit.fill,
              errorBuilder: (_, __, ___) {
                return Image.asset(
                  AppImages.mobileNotLoad,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            height: 24,
            width: 24,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.dark.withOpacity(0.1),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Icon(
                isFavorite ? BootstrapIcons.heart_fill : BootstrapIcons.heart,
                size: 10,
                color: AppColors.accent,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      discountPrice,
                      style: const AppTextStyle().copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      price,
                      style: const AppTextStyle().copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.dark.withOpacity(0.3),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const AppTextStyle().copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
