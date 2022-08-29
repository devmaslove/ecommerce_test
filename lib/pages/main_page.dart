import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppImages.filter,
              width: 11,
              height: 13,
            ),
            tooltip: 'Open filter',
            onPressed: () {},
          ),
          const SizedBox(width: 17),
        ],
      ),
      body: ListView(
        children: [
          ListTitleWidget(
            title: 'Select Category',
            buttonText: 'view all',
            onPressed: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 15,
              ),
              child: Row(
                children: [
                  CategoryWidget(
                    title: 'Phones',
                    selected: true,
                    imageAssetName: AppImages.phones,
                    imageWidth: 18.33,
                    imageHeight: 30,
                    onPressed: () {},
                  ),
                  CategoryWidget(
                    title: 'Computer',
                    selected: false,
                    imageAssetName: AppImages.computer,
                    imageWidth: 29,
                    imageHeight: 31,
                    onPressed: () {},
                  ),
                  CategoryWidget(
                    title: 'Health',
                    selected: false,
                    imageAssetName: AppImages.health,
                    imageWidth: 32,
                    imageHeight: 30,
                    onPressed: () {},
                  ),
                  CategoryWidget(
                    title: 'Books',
                    selected: false,
                    imageAssetName: AppImages.books,
                    imageWidth: 21,
                    imageHeight: 28.06,
                    onPressed: () {},
                  ),
                  CategoryWidget(
                    title: 'Other',
                    selected: false,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final String? imageAssetName;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback onPressed;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.selected,
    this.imageAssetName,
    this.imageWidth,
    this.imageHeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      color: AppColors.background,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 71,
                height: 71,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.accent : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: imageAssetName != null &&
                        imageWidth != null &&
                        imageHeight != null
                    ? SvgPicture.asset(
                        imageAssetName!,
                        width: imageWidth!,
                        height: imageHeight!,
                        color: selected
                            ? Colors.white
                            : AppColors.dark.withOpacity(0.3),
                      )
                    : null,
              ),
              const SizedBox(height: 7),
              Text(
                title,
                style: const AppTextStyle().copyWith(
                  color: selected ? AppColors.accent : AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const ListTitleWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 17),
        Text(
          title,
          style: const AppTextStyle().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
          child: Text(
            buttonText,
            style: const AppTextStyle().copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.accent,
            ),
          ),
        ),
        const SizedBox(width: 17),
      ],
    );
  }
}
