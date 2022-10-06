import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:ecommerce_test/ui/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsTitleWidget extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final double rating;
  final VoidCallback onFavorite;

  const DetailsTitleWidget({
    super.key,
    required this.title,
    required this.isFavorite,
    required this.rating,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const AppTextStyle().copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 7),
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColors.star,
                ),
                itemCount: 5,
                itemSize: 18,
                itemPadding: const EdgeInsets.only(right: 9),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ColorButtonWidget(
          imageAssetName: isFavorite ? AppImages.favOn : AppImages.favOff,
          imageWidth: 11,
          imageHeight: 10,
          color: AppColors.dark,
          onPressed: onFavorite,
        ),
      ],
    );
  }
}
