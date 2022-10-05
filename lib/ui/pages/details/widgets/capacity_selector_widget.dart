import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CapacitySelectorWidget extends StatelessWidget {
  final int selectedCapacity;
  final List<String> capacities;
  final ValueChanged<int> onSelect;

  const CapacitySelectorWidget({
    super.key,
    required this.selectedCapacity,
    required this.capacities,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      children: [
        for (int i = 0; i < capacities.length; i++)
          _CapacityWidget(
            capacity: capacities[i],
            selected: selectedCapacity == i,
            onTap: () => onSelect(i),
          ),
      ],
    );
  }
}

class _CapacityWidget extends StatelessWidget {
  final bool selected;
  final String capacity;
  final VoidCallback onTap;

  const _CapacityWidget({
    required this.selected,
    required this.capacity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.accent : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 72,
          ),
          child: Ink(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 6,
            ),
            child: Text(
              '$capacity GB',
              textAlign: TextAlign.center,
              style: const AppTextStyle().copyWith(
                color: selected ? Colors.white : AppColors.greyCapacity,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
