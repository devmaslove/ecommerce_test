import 'package:ecommerce_test/pages/main/widgets/select_dropdown_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:ecommerce_test/widgets/color_button_widget.dart';
import 'package:flutter/material.dart';

class FilterOptionsBottomSheet extends StatelessWidget {
  const FilterOptionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: ColorButtonWidget(
                    imageAssetName: AppImages.cross,
                    imageWidth: 11,
                    imageHeight: 10,
                    color: AppColors.dark,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Filter options',
                  style: const AppTextStyle().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.dark,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ColorButtonWidget(
                    text: 'Done',
                    color: AppColors.accent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 44),
        Padding(
          padding: const EdgeInsets.only(left: 46, right: 31),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brand',
                style: const AppTextStyle().copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 10, width: double.infinity),
              const SelectDropdownWidget(
                values: ['Samsung', 'Xiaomi', 'Motorola', 'Apple'],
              ),
              const SizedBox(height: 14),
              Text(
                'Price',
                style: const AppTextStyle().copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 10),
              const SelectDropdownWidget(
                values: [
                  '\$300 - \$500',
                  '\$500 - \$1000',
                  '\$1000 - \$5000',
                  '\$5000 - \$10000'
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Size',
                style: const AppTextStyle().copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 10),
              const SelectDropdownWidget(
                values: ['4.5 to 5.5 inches'],
              ),
            ],
          ),
        ),
        const SizedBox(height: 44),
      ],
    );
  }
}
