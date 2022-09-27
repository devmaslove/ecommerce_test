import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsInfoWidget extends StatelessWidget {
  final String text;
  final String imageAssetName;
  final double imageWidth;
  final double imageHeight;

  const DetailsInfoWidget({
    super.key,
    required this.text,
    required this.imageAssetName,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            imageAssetName,
            width: imageWidth,
            height: imageHeight,
            color: AppColors.greyDetails,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const AppTextStyle().copyWith(
            fontSize: 11,
            height: 14 / 11,
            fontWeight: FontWeight.w400,
            color: AppColors.greyDetails,
            letterSpacing: null,
          ),
        )
      ],
    );
  }
}
