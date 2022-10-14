import 'package:badges/badges.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/cart/cart_page.dart';
import 'package:ecommerce_test/ui/pages/details/bloc/details_bloc.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/capacity_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/colors_selector_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_carousel_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_row_info_widget.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_titile_widget.dart';
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
      child: const DetailsContent(),
    );
  }
}

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        final countCart = state is DetailsLoaded ? state.countCart : 0;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.dark,
            centerTitle: true,
            actions: [
              if (state is DetailsLoaded)
                IconButton(
                  icon: Icon(
                    state.isFavorite
                        ? BootstrapIcons.heart_fill
                        : BootstrapIcons.heart,
                  ),
                  tooltip: state.isFavorite
                      ? 'Remove from Favorites'
                      : 'Add to Favorites',
                  onPressed: () {
                    context
                        .read<DetailsBloc>()
                        .add(const DetailsToggleFavoriteEvent());
                  },
                ),
              Badge(
                badgeContent: Text(
                  '$countCart',
                  style: const AppTextStyle().copyWith(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                showBadge: countCart > 0,
                badgeColor: AppColors.accent,
                animationType: BadgeAnimationType.scale,
                animationDuration: const Duration(milliseconds: 250),
                position: BadgePosition.topEnd(end: 2, top: 4),
                child: IconButton(
                  icon: const Icon(BootstrapIcons.handbag),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const CartPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
            leading: IconButton(
              icon: const Icon(BootstrapIcons.chevron_left),
              onPressed: () => Navigator.of(context).maybePop(),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            ),
            title: const Text('Product Details'),
            titleTextStyle: const AppTextStyle().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.dark,
            ),
          ),
          body: buildContent(state),
        );
      },
    );
  }

  Widget buildContent(DetailsState state) {
    if (state is DetailsLoading) {
      return const DetailsContentLoading();
    }
    if (state is DetailsLoaded) {
      return DetailsContentLoaded(state: state);
    }
    if (state is DetailsErrorNetwork) {
      return const DetailsContentLoadError();
    }
    return const SizedBox.shrink();
  }
}

class DetailsContentLoading extends StatelessWidget {
  const DetailsContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.accent,
      ),
    );
  }
}

class DetailsContentLoadError extends StatelessWidget {
  const DetailsContentLoadError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Failed to load data',
        style: const AppTextStyle().copyWith(
          fontSize: 20,
          color: AppColors.dark,
        ),
      ),
    );
  }
}

class DetailsContentLoaded extends StatelessWidget {
  final DetailsLoaded state;

  const DetailsContentLoaded({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DetailsCarouselWidget(imagesLinks: state.images),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: DetailsTitleWidget(
            title: state.title,
            rating: state.rating,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: DetailsRowInfoWidget(
            sd: state.sd,
            ssd: state.ssd,
            camera: state.camera,
            cpu: state.cpu,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Select color and capacity',
            style: const AppTextStyle().copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 20 / 15,
              color: AppColors.dark,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              ColorsSelectorWidget(
                colors: state.colors,
                selectedColor: state.selectedColor,
                onSelect: (index) => _sendEvent(
                  context,
                  DetailsColorSelectEvent(index),
                ),
              ),
              const SizedBox(width: 12),
              const Spacer(),
              CapacitySelectorWidget(
                capacities: state.capacities,
                selectedCapacity: state.selectedCapacity,
                onSelect: (index) => _sendEvent(
                  context,
                  DetailsCapacitySelectEvent(index),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: BigButtonWidget(
            text: 'Add to Card',
            textRight: state.price,
            onPressed: () => _sendEvent(
              context,
              const DetailsAddToCartEvent(),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  _sendEvent(BuildContext context, final DetailsEvent event) {
    context.read<DetailsBloc>().add(event);
  }
}
