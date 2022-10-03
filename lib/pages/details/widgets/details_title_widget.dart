import 'package:badges/badges.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';

class DetailsTitleWidget extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCart;
  final int cartCount;

  const DetailsTitleWidget({
    super.key,
    required this.onBack,
    required this.onCart,
    required this.cartCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 42),
        ColorButtonWidget(
          imageAssetName: AppImages.back,
          imageWidth: 7,
          imageHeight: 14,
          color: AppColors.dark,
          onPressed: onBack,
        ),
        const SizedBox(width: 51),
        Text(
          'Product Details',
          style: const AppTextStyle().copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
          ),
        ),
        const Spacer(),
        Badge(
          badgeContent: Text(
            '$cartCount',
            style: const AppTextStyle().copyWith(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
          showBadge: cartCount > 0,
          badgeColor: AppColors.dark,
          animationType: BadgeAnimationType.scale,
          animationDuration: const Duration(milliseconds: 250),
          position: BadgePosition.topEnd(end: -8),
          child: ColorButtonWidget(
            imageAssetName: AppImages.cart,
            imageWidth: 14,
            imageHeight: 14,
            color: AppColors.accent,
            onPressed: onCart,
          ),
        ),
        const SizedBox(width: 35),
      ],
    );
  }
}
