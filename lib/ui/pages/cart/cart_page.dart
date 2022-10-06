import 'package:ecommerce_test/ui/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_test/ui/pages/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_test/ui/pages/cart/widgets/two_column_text_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:ecommerce_test/ui/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(const CartLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(backgroundColor: AppColors.dark),
        body: const CartContent(),
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CartContentLoading();
        }
        if (state is CartErrorNetwork) {
          return const CartContentLoadError();
        }
        if (state is CartLoaded) {
          if (state.items.isEmpty) {
            return const CartContentEmpty();
          } else {
            return CartContentLoaded(state);
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class CartContentLoaded extends StatelessWidget {
  final CartLoaded state;

  const CartContentLoaded(
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItemWidget(
                item: state.items[index],
                onDelete: () {
                  context.read<CartBloc>().add(CartRemoveItemEvent(index));
                },
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 44);
            },
          ),
        ),
        Divider(
          height: 2,
          color: Colors.white.withOpacity(0.25),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 55, right: 35),
          child: TwoColumnTextWidget(
            leftText: 'Total',
            rightText: state.total,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 55, right: 35),
          child: TwoColumnTextWidget(
            leftText: 'Delivery',
            rightText: state.delivery,
          ),
        ),
        const SizedBox(height: 28),
        Divider(
          height: 1,
          color: Colors.white.withOpacity(0.20),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: BigButtonWidget(
            text: 'Checkout',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(height: 44),
      ],
    );
  }
}

class CartContentLoading extends StatelessWidget {
  const CartContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

class CartContentLoadError extends StatelessWidget {
  const CartContentLoadError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Failed to load data',
        style: const AppTextStyle().copyWith(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CartContentEmpty extends StatelessWidget {
  const CartContentEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'Your cart is currently no products',
              style: const AppTextStyle().copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        Divider(
          height: 1,
          color: Colors.white.withOpacity(0.20),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: BigButtonWidget(
            text: 'Start shopping',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(height: 44),
      ],
    );
  }
}
