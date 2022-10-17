import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/cart/models/cart_item_model.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onDelete;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            item.images,
            fit: BoxFit.fitHeight,
            width: 68,
            height: 68,
            errorBuilder: (_, __, ___) {
              return Image.asset(
                AppImages.mobileNotLoad,
                width: 68,
                height: 68,
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.title,
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
                item.price,
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
        const SizedBox(width: 12),
        IconButton(
          color: Colors.white,
          icon: const Icon(BootstrapIcons.trash3_fill),
          iconSize: 20,
          onPressed: onDelete,
        )
      ],
    );
  }
}
