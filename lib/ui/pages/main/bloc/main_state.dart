part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoading extends MainState {
  @override
  List<Object> get props => [];
}

class MainCategoryLoading extends MainState {
  final String selectedCategory;

  const MainCategoryLoading({
    required this.selectedCategory,
  });

  @override
  List<Object> get props => [selectedCategory];
}

class MainErrorNetwork extends MainState {
  final String selectedCategory;

  const MainErrorNetwork({
    required this.selectedCategory,
  });

  @override
  List<Object> get props => [selectedCategory];
}

class MainLoaded extends MainState {
  final MainFilterItemsModel selectedFilter;
  final String selectedCategory;
  final List<MainHomeItemModel> itemsHome;
  final List<MainBestItemModel> itemsBest;

  const MainLoaded({
    required this.selectedCategory,
    required this.selectedFilter,
    required this.itemsHome,
    required this.itemsBest,
  });

  List<MainBestItemModel> get itemsBestFiltered {
    return itemsBest.where((item) {
      if (!selectedFilter.isFilterSet) return true;
      if (item.priceForFilter < selectedFilter.priceBottom ||
          item.priceForFilter > selectedFilter.priceTop) {
        return false;
      }
      return item.title.contains(selectedFilter.brand);
    }).toList();
  }

  @override
  List<Object> get props => [
        selectedCategory,
        selectedFilter,
        itemsHome,
        itemsBest,
      ];
}
