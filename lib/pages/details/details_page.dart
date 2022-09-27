import 'package:ecommerce_test/pages/details/bloc/details_bloc.dart';
import 'package:ecommerce_test/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_tabs_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_title_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc()..add(const DetailsLoadEvent()),
      child: const Scaffold(
        body: DetailsContent(),
      ),
    );
  }
}

class DetailsContent extends StatelessWidget {
  const DetailsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading) {
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 30),
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }
        if (state is DetailsLoaded) {
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: DetailsCarouselWidget(
                  imagesLinks: state.images,
                ),
              ),
              const SizedBox(height: 7),
              BottomDetailsWidget(
                onAddToCart: () {},
                onFavorite: () => context
                    .read<DetailsBloc>()
                    .add(const DetailsToggleFavoriteEvent()),
                title: state.title,
                isFavorite: state.isFavorites,
                rating: state.rating,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
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
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: DetailsTabsWidget(),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
