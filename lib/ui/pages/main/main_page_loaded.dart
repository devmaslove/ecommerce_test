import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/details/details_page.dart';
import 'package:ecommerce_test/ui/pages/main/bloc/main_bloc.dart';
import 'package:ecommerce_test/ui/pages/main/filter_options_bottom_sheet.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/best_seller_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_best_sellers_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_categories_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_hot_sales_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageLoaded extends StatelessWidget {
  final MainLoaded state;

  const MainPageLoaded(
    this.state, {
    super.key,
  });

  void showFilterOptionsBottomSheet(BuildContext context) {
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
  }

  void gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const DetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListCategoriesWidget(
                selectedCategory: state.selectedCategory,
                onSelectCategory: (category) {
                  final bloc = context.read<MainBloc>();
                  bloc.add(MainSelectCategoryEvent(category));
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListHotSalesWidget(
                height: 180,
                items: state.itemsHome,
                onBuy: (_) => gotoDetailsPage(context),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTitleWidget(
                title: 'Best Seller',
                buttonText: 'Filter',
                buttonIcon: BootstrapIcons.funnel,
                onPressed: () => showFilterOptionsBottomSheet(context),
              ),
            ),
            const SizedBox(height: 12),
            ListBestSellersWidget(
              children: [
                ...state.itemsBest
                    .map(
                      (item) => BestSellerWidget(
                        picture: item.picture,
                        isFavorite: item.isFavorites,
                        title: item.title,
                        discountPrice: item.priceWithDiscount,
                        price: item.price,
                        onTap: () => gotoDetailsPage(context),
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
