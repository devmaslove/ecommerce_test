import 'package:ecommerce_test/pages/cart/cart_page.dart';
import 'package:ecommerce_test/pages/details/bloc/details_bloc.dart';
import 'package:ecommerce_test/pages/details/widgets/capacity_selector_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/colors_selector_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_info_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_tabs_widget.dart';
import 'package:ecommerce_test/pages/details/widgets/details_title_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/big_botton_widget.dart';
import 'package:ecommerce_test/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

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
                onCart: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                ),
                cartCount: 0,
              ),
              const SizedBox(height: 30),
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }
        if (state is DetailsLoaded) {
          final oCcy = NumberFormat("\$#,##0.00", "en_US");
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                ),
                cartCount: state.countCart,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: DetailsCarouselWidget(
                  imagesLinks: state.images,
                ),
              ),
              const SizedBox(height: 7),
              BottomDetailsWidget(
                onCapacitySelect: (index) => context
                    .read<DetailsBloc>()
                    .add(DetailsCapacitySelectEvent(index)),
                onColorSelect: (index) => context
                    .read<DetailsBloc>()
                    .add(DetailsColorSelectEvent(index)),
                onAddToCart: () => context
                    .read<DetailsBloc>()
                    .add(const DetailsAddToCartEvent()),
                onFavorite: () => context
                    .read<DetailsBloc>()
                    .add(const DetailsToggleFavoriteEvent()),
                title: state.title,
                isFavorite: state.isFavorites,
                rating: state.rating,
                cpu: state.cpu,
                camera: state.camera,
                sd: state.sd,
                ssd: state.ssd,
                colors: state.color,
                selectedColor: state.selectedColor,
                selectedCapacity: state.selectedCapacity,
                capacities: state.capacity,
                price: oCcy.format(state.price),
              ),
            ],
          );
        }
        if (state is DetailsErrorNetwork) {
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                ),
                cartCount: 0,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Text(
                    'Не удалось загрузить данные',
                    style: const AppTextStyle().copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
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
  final String price;
  final String cpu;
  final String camera;
  final String ssd;
  final String sd;
  final bool isFavorite;
  final double rating;
  final int selectedColor;
  final List<String> colors;
  final VoidCallback onAddToCart;
  final VoidCallback onFavorite;
  final ValueChanged<int> onColorSelect;
  final int selectedCapacity;
  final List<String> capacities;
  final ValueChanged<int> onCapacitySelect;

  const BottomDetailsWidget({
    super.key,
    required this.onAddToCart,
    required this.onFavorite,
    required this.title,
    required this.price,
    required this.isFavorite,
    required this.rating,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
    required this.selectedColor,
    required this.colors,
    required this.onColorSelect,
    required this.selectedCapacity,
    required this.capacities,
    required this.onCapacitySelect,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: DetailsInfoWidget(
                  text: cpu,
                  imageWidth: 28,
                  imageHeight: 28,
                  imageAssetName: AppImages.cpu,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: camera,
                  imageWidth: 28,
                  imageHeight: 22,
                  imageAssetName: AppImages.camera,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: ssd,
                  imageWidth: 28,
                  imageHeight: 21,
                  imageAssetName: AppImages.ssd,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: sd,
                  imageWidth: 19,
                  imageHeight: 22,
                  imageAssetName: AppImages.sd,
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Text(
              'Select color and capacity',
              style: const AppTextStyle().copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 20 / 16,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const SizedBox(width: 34),
              ColorsSelectorWidget(
                colors: colors,
                selectedColor: selectedColor,
                onSelect: onColorSelect,
              ),
              const SizedBox(width: 18),
              const Spacer(),
              CapacitySelectorWidget(
                capacities: capacities,
                selectedCapacity: selectedCapacity,
                onSelect: onCapacitySelect,
              ),
              const SizedBox(width: 34),
            ],
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BigButtonWidget(
              text: 'Add to Card',
              textRight: price,
              onPressed: onAddToCart,
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
