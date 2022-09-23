import 'package:ecommerce_test/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_title_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

enum ProductColors { brown, black }

enum ProductCapacity { gb128, gb256 }

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  String selectedTab = 'Shop';
  ProductColors selectedColor = ProductColors.brown;
  ProductCapacity selectedCapacity = ProductCapacity.gb128;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          DetailsTitleWidget(
            onBack: () => Navigator.of(context).pop(),
            onCart: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 30),
          const Expanded(
            child: DetailsCarouselWidget(
              imagesLinks: [
                "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
                "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
              ],
            ),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: BottomDetailsWidget(
              onAddToCart: () {},
              onFavorite: () => setState(() => isFavorite = !isFavorite),
              title: 'Galaxy Note 20 Ultra',
              isFavorite: isFavorite,
              rating: 4.5,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomDetailsWidget extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final double rating;
  final VoidCallback onAddToCart;
  final VoidCallback onFavorite;

  const BottomDetailsWidget({
    super.key,
    required this.onAddToCart,
    required this.onFavorite,
    required this.title,
    required this.isFavorite,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDetails.withOpacity(0.1),
            offset: const Offset(0, -5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 38),
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
              const SizedBox(width: 38),
            ],
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
