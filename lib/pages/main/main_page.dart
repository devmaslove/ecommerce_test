import 'package:ecommerce_test/pages/main/filter_options_bottom_sheet.dart';
import 'package:ecommerce_test/pages/main/widgets/best_seller_widget.dart';
import 'package:ecommerce_test/pages/main/widgets/category_widget.dart';
import 'package:ecommerce_test/pages/main/widgets/hot_sale_widget.dart';
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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  builder: (context) {
                    return const FilterOptionsBottomSheet();
                  });
            },
          ),
          const SizedBox(width: 17),
        ],
      ),
      body: ListView(
        children: [
          ListTitle(
            title: 'Select Category',
            buttonText: 'view all',
            onPressed: () {},
          ),
          ListCategories(
            selectedCategory: selectedCategory,
            onSelectCategory: (String category) {
              setState(() => selectedCategory = category);
            },
          ),
          const ListHotSales(
            children: [
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
          ListTitle(
            title: 'Best Seller',
            buttonText: 'see more',
            onPressed: () {},
          ),
          const ListBestSellers(
            children: [
              BestSellerWidget(
                picture:
                    'https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg',
                isFavorite: false,
                title: 'Samsung Galaxy s20 Ultra',
                discountPrice: 1047,
                price: 1500,
              ),
              BestSellerWidget(
                picture:
                    'https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg',
                isFavorite: true,
                title: 'Xiaomi Mi 10 Pro',
                discountPrice: 300,
                price: 400,
              ),
              BestSellerWidget(
                picture:
                    'https://opt-1739925.ssl.1c-bitrix-cdn.ru/upload/iblock/c01/c014d088c28d45b606ed8c58e5817172.jpg?160405904823488',
                isFavorite: true,
                title: 'Samsung Note 20 Ultra',
                discountPrice: 1047,
                price: 1500,
              ),
              BestSellerWidget(
                picture: 'https://www.benchmark.rs/assets/img/news/edge1.jpg',
                isFavorite: false,
                title: 'Motorola One Edge',
                discountPrice: 300,
                price: 400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListBestSellers extends StatelessWidget {
  final List<Widget> children;

  const ListBestSellers({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 15,
        right: 21,
        top: 16,
        bottom: 22,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 14,
        mainAxisExtent: 227,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

class ListHotSales extends StatelessWidget {
  final List<Widget> children;

  const ListHotSales({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 21,
        top: 8,
        bottom: 11,
      ),
      height: 182,
      child: PageView(children: children),
    );
  }
}

class ListCategories extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;

  const ListCategories({
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

class ListTitle extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const ListTitle({
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
