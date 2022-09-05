import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class HotSaleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picture;
  final bool isNew;

  const HotSaleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 98,
            top: -10,
            height: 221,
            width: 384,
            child: Image.network(
              picture,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 25,
            bottom: 26,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 5,
                ),
              ),
              child: Text(
                'Buy now!',
                style: const AppTextStyle().copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 11,
                  height: 13 / 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 75,
            child: Text(
              subtitle,
              style: const AppTextStyle().copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 11,
                height: 13 / 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 93,
            child: Text(
              title,
              style: const AppTextStyle().copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 25,
                height: 30 / 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          if (isNew)
            Positioned(
              left: 25,
              top: 14,
              child: Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'New',
                  style: const AppTextStyle().copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 10,
                    height: 12 / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
