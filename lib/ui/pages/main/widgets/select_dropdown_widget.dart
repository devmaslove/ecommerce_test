import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class SelectDropdownWidget extends StatelessWidget {
  final String selected;
  final List<String> values;
  final ValueChanged<String> onChange;

  const SelectDropdownWidget({
    super.key,
    required this.values,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 36,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.dark.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButton<String>(
          value: selected.isNotEmpty ? selected : null,
          hint: Text(
            selected,
            style: const AppTextStyle().copyWith(
              fontSize: 18,
              color: AppColors.dark,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: const AppTextStyle().copyWith(
            fontSize: 18,
            color: AppColors.dark,
            fontWeight: FontWeight.w400,
          ),
          iconDisabledColor: AppColors.dark.withOpacity(0.3),
          iconEnabledColor: AppColors.dark.withOpacity(0.3),
          isExpanded: true,
          isDense: true,
          onChanged: (value) => onChange(value ?? ''),
          items: buildItems(),
          borderRadius: BorderRadius.circular(4),
          icon: Icon(
            BootstrapIcons.chevron_down,
            size: 16,
            color: AppColors.dark.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>>? buildItems() {
    if (values.length < 2) return null;
    return values
        .map(
          (value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
  }
}
