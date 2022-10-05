import 'package:ecommerce_test/pages/details/details_page.dart';
import 'package:ecommerce_test/pages/main/bloc/main_bloc.dart';
import 'package:ecommerce_test/pages/main/filter_options_bottom_sheet.dart';
import 'package:ecommerce_test/pages/main/widgets/best_seller_widget.dart';
import 'package:ecommerce_test/pages/main/widgets/category_widget.dart';
import 'package:ecommerce_test/pages/main/widgets/hot_sale_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:ecommerce_test/resources/app_images.dart';
import 'package:ecommerce_test/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(const MainLoadEvent()),
      child: Scaffold(
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
                  },
                );
              },
            ),
            const SizedBox(width: 17),
          ],
        ),
        body: const MainPageContent(),
      ),
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MainErrorNetwork) {
          return Center(
            child: Text(
              'Failed to load data',
              style: const AppTextStyle().copyWith(
                fontSize: 20,
              ),
            ),
          );
        }
        if (state is MainLoaded) {
          return ListView(
            children: [
              ListTitle(
                title: 'Select Category',
                buttonText: 'view all',
                onPressed: () {},
              ),
              ListCategories(
                selectedCategory: state.selectedCategory,
                onSelectCategory: (String category) {
                  context.read<MainBloc>().add(
                        MainSelectCategoryEvent(category),
                      );
                },
              ),
              ListHotSales(
                children: [
                  ...state.itemsHome
                      .map(
                        (item) => HotSaleWidget(
                          title: item.title,
                          onBuy: item.isBuy
                              ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DetailsPage(),
                                    ),
                                  );
                                }
                              : null,
                          isNew: item.isNew,
                          subtitle: item.subtitle,
                          picture: item.picture,
                        ),
                      )
                      .toList(),
                ],
              ),
              ListTitle(
                title: 'Best Seller',
                buttonText: 'see more',
                onPressed: () {},
              ),
              ListBestSellers(
                children: [
                  ...state.itemsBest
                      .map(
                        (item) => BestSellerWidget(
                          picture: item.picture,
                          isFavorite: item.isFavorites,
                          title: item.title,
                          discountPrice: item.priceWithDiscount,
                          price: item.price,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const DetailsPage(),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
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
              imageWidth: 19,
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
              imageHeight: 29,
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
