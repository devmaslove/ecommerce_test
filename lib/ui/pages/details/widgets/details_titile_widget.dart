import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsTitleWidget extends StatelessWidget {
  final String title;
  final double rating;

  const DetailsTitleWidget({
    super.key,
    required this.title,
    required this.rating,
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
              const SizedBox(height: 8),
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => const Icon(
                  BootstrapIcons.star_fill,
                  color: AppColors.star,
                ),
                itemCount: 5,
                itemSize: 18,
                itemPadding: const EdgeInsets.only(right: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
