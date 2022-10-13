import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/details/details_page.dart';
import 'package:ecommerce_test/ui/pages/main/bloc/main_bloc.dart';
import 'package:ecommerce_test/ui/pages/main/filter_options_bottom_sheet.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_filter_items_model.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_best_sellers_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_categories_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_hot_sales_widget.dart';
import 'package:ecommerce_test/ui/pages/main/widgets/list_title_widget.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageLoaded extends StatelessWidget {
  final MainLoaded state;

  const MainPageLoaded(
    this.state, {
    super.key,
  });

  void showFilterOptionsBottomSheet(BuildContext context) {
    final bloc = context.read<MainBloc>();
    showModalBottomSheet<MainFilterItemsModel>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return FilterOptionsBottomSheet(
          selected: state.selectedFilter,
        );
      },
    ).then((result) {
      if (result != null) {
        bloc.add(MainSetFilterEvent(result));
      }
    });
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
            ListCategoriesWidget(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              selectedCategory: state.selectedCategory,
              onSelectCategory: (category) {
                final bloc = context.read<MainBloc>();
                bloc.add(MainSelectCategoryEvent(category));
              },
            ),
            const SizedBox(height: 12),
            if (state.itemsHome.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListHotSalesWidget(
                  height: 180,
                  items: state.itemsHome,
                  onBuy: (_) => gotoDetailsPage(context),
                ),
              ),
            if (state.itemsHome.isNotEmpty) const SizedBox(height: 20),
            if (state.itemsBest.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTitleWidget(
                  title: 'Best Seller',
                  buttonText: state.selectedFilter.toFilterString(),
                  buttonIcon: BootstrapIcons.funnel,
                  onPressed: () => showFilterOptionsBottomSheet(context),
                ),
              ),
            if (state.itemsBest.isNotEmpty) const SizedBox(height: 12),
            if (state.itemsBest.isNotEmpty &&
                state.itemsBestFiltered.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListBestSellersWidget(
                  items: state.itemsBestFiltered,
                  onBuy: (_) => gotoDetailsPage(context),
                ),
              ),
            if (state.itemsBest.isNotEmpty && state.itemsBestFiltered.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Center(
                  child: Text(
                    'No items',
                    style: const AppTextStyle().copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
