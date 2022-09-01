import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedCategory = 'Phones';

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
          ListCategoriesWidget(
            selectedCategory: selectedCategory,
            onSelectCategory: (String category) {
              setState(() => selectedCategory = category);
            },
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 21,
              top: 8,
              bottom: 11,
            ),
            height: 182,
            child: PageView(
              children: const [
                HotSaleWidget(
                  title: "Iphone 12",
                  isNew: true,
                  subtitle: "Súper. Mega. Rápido.",
                  picture:
                      "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
                ),
                HotSaleWidget(
                  title: "Samsung Galaxy A71",
                  isNew: false,
                  subtitle: "Súper. Mega. Rápido.",
                  picture:
                      "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg",
                ),
                HotSaleWidget(
                  title: "Xiaomi Mi 11 ultra",
                  isNew: false,
                  subtitle: "Súper. Mega. Rápido.",
                  picture:
                      "https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotSaleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picture;
  final bool isNew;

  const HotSaleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 98,
            top: -10,
            height: 221,
            width: 384,
            child: Image.network(
              picture,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 25,
            bottom: 26,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 5,
                ),
              ),
              child: Text(
                'Buy now!',
                style: const AppTextStyle().copyWith(
                  fontFamily: 'SF Pro Display',
                  fontSize: 11,
                  height: 13 / 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 75,
            child: Text(
              subtitle,
              style: const AppTextStyle().copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 11,
                height: 13 / 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 93,
            child: Text(
              title,
              style: const AppTextStyle().copyWith(
                fontFamily: 'SF Pro Display',
                fontSize: 25,
                height: 30 / 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          if (isNew)
            Positioned(
              left: 25,
              top: 14,
              child: Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'New',
                  style: const AppTextStyle().copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 10,
                    height: 12 / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ListCategoriesWidget extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;

  const ListCategoriesWidget({
    super.key,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              selected: selectedCategory == 'Phones',
              imageAssetName: AppImages.phones,
              imageWidth: 18.33,
              imageHeight: 30,
              onPressed: () => onSelectCategory('Phones'),
            ),
            CategoryWidget(
              title: 'Computer',
              selected: selectedCategory == 'Computer',
              imageAssetName: AppImages.computer,
              imageWidth: 29,
              imageHeight: 31,
              onPressed: () => onSelectCategory('Computer'),
            ),
            CategoryWidget(
              title: 'Health',
              selected: selectedCategory == 'Health',
              imageAssetName: AppImages.health,
              imageWidth: 32,
              imageHeight: 30,
              onPressed: () => onSelectCategory('Health'),
            ),
            CategoryWidget(
              title: 'Books',
              selected: selectedCategory == 'Books',
              imageAssetName: AppImages.books,
              imageWidth: 21,
              imageHeight: 28.06,
              onPressed: () => onSelectCategory('Books'),
            ),
            CategoryWidget(
              title: 'Other',
              selected: selectedCategory == 'Other',
              onPressed: () => onSelectCategory('Other'),
            ),
          ],
        ),
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
