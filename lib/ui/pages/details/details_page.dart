import 'package:ecommerce_test/ui/pages/cart/cart_page.dart';
import 'package:ecommerce_test/ui/pages/details/bloc/details_bloc.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/capacity_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/colors_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_info_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_tabs_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_title_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:ecommerce_test/ui/widgets/big_button_widget.dart';
import 'package:ecommerce_test/ui/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

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
  const DetailsContent({super.key});

  void gotoCartPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const CartPage(),
      ),
    );
  }

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
                onCart: () => gotoCartPage(context),
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
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => gotoCartPage(context),
                cartCount: state.countCart,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: DetailsCarouselWidget(
                  imagesLinks: state.images,
                ),
              ),
              const SizedBox(height: 7),
              BottomDetailsWidget(state: state),
            ],
          );
        }
        if (state is DetailsErrorNetwork) {
          return Column(
            children: [
              const SizedBox(height: 30),
              DetailsTitleWidget(
                onBack: () => Navigator.of(context).pop(),
                onCart: () => gotoCartPage(context),
                cartCount: 0,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Text(
                    'Failed to load data',
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
  final DetailsLoaded state;

  const BottomDetailsWidget({
    super.key,
    required this.state,
  });

  sendEvent(BuildContext context, final DetailsEvent event) {
    context.read<DetailsBloc>().add(event);
  }

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
                      state.title,
                      style: const AppTextStyle().copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 7),
                    RatingBarIndicator(
                      rating: state.rating,
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
                imageAssetName:
                    state.isFavorites ? AppImages.favOn : AppImages.favOff,
                imageWidth: 11,
                imageHeight: 10,
                color: AppColors.dark,
                onPressed: () => sendEvent(
                  context,
                  const DetailsToggleFavoriteEvent(),
                ),
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
                  text: state.cpu,
                  imageWidth: 28,
                  imageHeight: 28,
                  imageAssetName: AppImages.cpu,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: state.camera,
                  imageWidth: 28,
                  imageHeight: 22,
                  imageAssetName: AppImages.camera,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: state.ssd,
                  imageWidth: 28,
                  imageHeight: 21,
                  imageAssetName: AppImages.ssd,
                ),
              ),
              Expanded(
                child: DetailsInfoWidget(
                  text: state.sd,
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
                colors: state.colors,
                selectedColor: state.selectedColor,
                onSelect: (index) => sendEvent(
                  context,
                  DetailsColorSelectEvent(index),
                ),
              ),
              const SizedBox(width: 18),
              const Spacer(),
              CapacitySelectorWidget(
                capacities: state.capacities,
                selectedCapacity: state.selectedCapacity,
                onSelect: (index) => sendEvent(
                  context,
                  DetailsCapacitySelectEvent(index),
                ),
              ),
              const SizedBox(width: 34),
            ],
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BigButtonWidget(
              text: 'Add to Card',
              textRight: state.price,
              onPressed: () => sendEvent(
                context,
                const DetailsAddToCartEvent(),
              ),
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
