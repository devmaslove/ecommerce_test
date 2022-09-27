import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class DetailsTabsWidget extends StatelessWidget {
  const DetailsTabsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        indicatorWeight: 3,
        indicatorColor: AppColors.accent,
        labelColor: AppColors.dark,
        labelStyle: const AppTextStyle().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        unselectedLabelStyle: const AppTextStyle().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(text: 'Shop', height: 40),
          Tab(text: 'Details', height: 40),
          Tab(text: 'Features', height: 40),
        ],
      ),
    );
  }
}
