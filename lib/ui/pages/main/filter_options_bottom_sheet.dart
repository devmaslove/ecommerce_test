import 'package:ecommerce_test/ui/pages/main/widgets/select_dropdown_widget.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class FilterOptionsBottomSheet extends StatelessWidget {
  const FilterOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              height: 4,
              width: 64,
              decoration: BoxDecoration(
                color: AppColors.dark.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Filter options',
              style: const AppTextStyle().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.dark,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Brand',
            style: const AppTextStyle().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          const SelectDropdownWidget(
            values: ['Samsung', 'Xiaomi', 'Motorola', 'Apple'],
          ),
          const SizedBox(height: 12),
          Text(
            'Price',
            style: const AppTextStyle().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          const SelectDropdownWidget(
            values: [
              '\$300 - \$500',
              '\$500 - \$1000',
              '\$1000 - \$5000',
              '\$5000 - \$10000'
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                    child: Text(
                      'Reset',
                      style: const AppTextStyle().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: const AppTextStyle().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
