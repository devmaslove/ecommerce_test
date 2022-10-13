import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectDropdownWidget extends StatefulWidget {
  final List<String> values;

  const SelectDropdownWidget({
    super.key,
    required this.values,
  });

  @override
  State<SelectDropdownWidget> createState() => _SelectDropdownWidgetState();
}

class _SelectDropdownWidgetState extends State<SelectDropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values.isNotEmpty ? widget.values[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 37,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.greyBorder),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          value: selectedValue,
          hint: selectedValue != null
              ? Text(
                  selectedValue!,
                  style: const AppTextStyle().copyWith(
                    fontSize: 18,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : null,
          style: const AppTextStyle().copyWith(
            fontSize: 18,
            color: AppColors.dark,
            fontWeight: FontWeight.w400,
          ),
          iconDisabledColor: AppColors.greyDropDownIcon,
          iconEnabledColor: AppColors.greyDropDownIcon,
          isExpanded: true,
          isDense: true,
          onChanged: (value) => setState(() => selectedValue = value),
          items: buildItems(),
          borderRadius: BorderRadius.circular(5),
          icon: SvgPicture.asset(
            AppImages.dropDown,
            width: 16,
            height: 8,
            color: AppColors.greyDropDownIcon,
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>>? buildItems() {
    if (widget.values.length < 2) return null;
    return widget.values
        .map((value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
