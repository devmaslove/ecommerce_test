import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class DetailsCarouselWidget extends StatelessWidget {
  final List<String> imagesLinks;

  const DetailsCarouselWidget({
    super.key,
    required this.imagesLinks,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowCarousel.withOpacity(0.16),
                offset: const Offset(0, 10),
                blurRadius: 20,
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            imagesLinks[index],
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return Image.asset(
                AppImages.mobileNotLoad,
                fit: BoxFit.contain,
              );
            },
          ),
        );
      },
      itemCount: imagesLinks.length,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
