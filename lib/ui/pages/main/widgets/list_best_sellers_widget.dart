import 'package:ecommerce_test/ui/pages/main/models/main_best_item_model.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';

class ListBestSellersWidget extends StatelessWidget {
  final List<MainBestItemModel> items;
  final ValueChanged<int> onBuy;

  const ListBestSellersWidget({
    super.key,
    required this.items,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 224,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return BestSellerWidget(
          picture: items[index].picture,
          isFavorite: items[index].isFavorites,
          title: items[index].title,
          discountPrice: items[index].priceWithDiscount,
          price: items[index].price,
          onTap: () => onBuy(index),
        );
      },
    );
  }
}
