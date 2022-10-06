import 'package:ecommerce_test/ui/pages/cart/cart_page.dart';
import 'package:ecommerce_test/ui/pages/details/bloc/details_bloc.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/capacity_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/colors_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_row_info_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_tabs_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_titile_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_top_bar_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:ecommerce_test/ui/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return DetailsContentLoading(onCart: () => gotoCartPage(context));
        }
        if (state is DetailsLoaded) {
          return DetailsContentLoaded(
            state: state,
            onCart: () => gotoCartPage(context),
          );
        }
        if (state is DetailsErrorNetwork) {
          return DetailsContentLoadError(onCart: () => gotoCartPage(context));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class DetailsContentLoading extends StatelessWidget {
  final VoidCallback onCart;

  const DetailsContentLoading({
    super.key,
    required this.onCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        DetailsTopBarWidget(
          onBack: () => Navigator.of(context).pop(),
          onCart: onCart,
          cartCount: 0,
        ),
        const SizedBox(height: 30),
        const Expanded(
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class DetailsContentLoadError extends StatelessWidget {
  final VoidCallback onCart;

  const DetailsContentLoadError({
    super.key,
    required this.onCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        DetailsTopBarWidget(
          onBack: () => Navigator.of(context).pop(),
          onCart: onCart,
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
}

class DetailsContentLoaded extends StatelessWidget {
  final VoidCallback onCart;
  final DetailsLoaded state;

  const DetailsContentLoaded({
    super.key,
    required this.state,
    required this.onCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        DetailsTopBarWidget(
          onBack: () => Navigator.of(context).pop(),
          onCart: onCart,
          cartCount: state.countCart,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: DetailsCarouselWidget(
            imagesLinks: state.images,
          ),
        ),
        const SizedBox(height: 7),
        Container(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: DetailsTitleWidget(
                  title: state.title,
                  isFavorite: state.isFavorite,
                  rating: state.rating,
                  onFavorite: () => _sendEvent(
                    context,
                    const DetailsToggleFavoriteEvent(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: DetailsTabsWidget(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DetailsRowInfoWidget(
                  sd: state.sd,
                  ssd: state.ssd,
                  camera: state.camera,
                  cpu: state.cpu,
                ),
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
                    onSelect: (index) => _sendEvent(
                      context,
                      DetailsColorSelectEvent(index),
                    ),
                  ),
                  const SizedBox(width: 18),
                  const Spacer(),
                  CapacitySelectorWidget(
                    capacities: state.capacities,
                    selectedCapacity: state.selectedCapacity,
                    onSelect: (index) => _sendEvent(
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
                  onPressed: () => _sendEvent(
                    context,
                    const DetailsAddToCartEvent(),
                  ),
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ],
    );
  }

  _sendEvent(BuildContext context, final DetailsEvent event) {
    context.read<DetailsBloc>().add(event);
  }
}
