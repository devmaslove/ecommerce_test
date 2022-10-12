import 'package:ecommerce_test/ui/pages/main/models/main_home_item_model.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/hot_sale_widget.dart';
import 'package:flutter/material.dart';

class ListHotSalesWidget extends StatelessWidget {
  final double height;
  final List<MainHomeItemModel> items;
  final ValueChanged<int> onBuy;

  const ListHotSalesWidget({
    super.key,
    required this.items,
    required this.height,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView(
        children: [
          for (int i = 0; i < items.length; i++)
            HotSaleWidget(
              height: height,
              title: items[i].title,
              onBuy: items[i].isBuy ? () => onBuy(i) : null,
              isNew: items[i].isNew,
              subtitle: items[i].subtitle,
              picture: items[i].picture,
            ),
        ],
      ),
    );
  }
}
