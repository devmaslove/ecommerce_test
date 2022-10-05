import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BestSellerWidget extends StatelessWidget {
  final String picture;
  final bool isFavorite;
  final String title;
  final int price;
  final int discountPrice;
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
    final oCcy = NumberFormat("\$#,##0", "en_US");
    return Card(
      color: Colors.white,
      shadowColor: AppColors.shadowCard.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -1,
            height: 168,
            width: 187,
            child: Image.network(
              picture,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 15,
            top: 11,
            height: 25,
            width: 25,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                isFavorite ? AppImages.favOn : AppImages.favOff,
                width: 11,
                height: 10,
                color: AppColors.accent,
              ),
            ),
          ),
          Positioned(
            top: 174,
            width: 140,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      oCcy.format(discountPrice),
                      style: const AppTextStyle().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      oCcy.format(price),
                      style: const AppTextStyle().copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  title,
                  style: const AppTextStyle().copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
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
