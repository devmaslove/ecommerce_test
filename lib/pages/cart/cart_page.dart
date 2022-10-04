import 'package:ecommerce_test/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/big_botton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(const CartLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          backgroundColor: AppColors.dark,
        ),
        body: const CartContent(),
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  const CartContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        if (state is CartErrorNetwork) {
          return Center(
            child: Text(
              'Не удалось загрузить данные',
              style: const AppTextStyle().copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          );
        }
        if (state is CartLoaded) {
          final oCcy = NumberFormat("\$#,##0 us", "en_US");
          return Column(
            children: [
              Expanded(
                child: state.items.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          'Your cart is currently no products',
                          style: const AppTextStyle().copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        itemCount: state.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  state.items[index].images,
                                  fit: BoxFit.fitHeight,
                                  width: 88,
                                  height: 88,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      state.items[index].title,
                                      style: const AppTextStyle().copyWith(
                                        fontSize: 20,
                                        height: 25 / 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '\$${state.items[index].price.toDouble().toStringAsFixed(2)}',
                                      style: const AppTextStyle().copyWith(
                                        fontSize: 20,
                                        height: 25 / 20,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.accent,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () => context
                                    .read<CartBloc>()
                                    .add(CartRemoveItemEvent(index)),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: 44);
                        },
                      ),
              ),
              if (state.items.isNotEmpty)
                Divider(
                  height: 2,
                  color: Colors.white.withOpacity(0.25),
                ),
              if (state.items.isNotEmpty) const SizedBox(height: 16),
              if (state.items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 35),
                  child: TwoColumnTextWidget(
                    leftText: 'Total',
                    rightText: oCcy.format(state.total),
                  ),
                ),
              if (state.items.isNotEmpty) const SizedBox(height: 12),
              if (state.items.isNotEmpty)
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
                  text: state.items.isEmpty ? 'Start shopping' : 'Checkout',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 44),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class TwoColumnTextWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const TwoColumnTextWidget({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftText,
          style: const AppTextStyle().copyWith(
            fontSize: 15,
            height: 19 / 15,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 80,
          child: Text(
            rightText,
            style: const AppTextStyle().copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 19 / 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
