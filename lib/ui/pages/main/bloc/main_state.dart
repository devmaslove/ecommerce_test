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

class MainErrorNetwork extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoaded extends MainState {
  final String selectedCategory;
  final List<MainHomeItemModel> itemsHome;
  final List<MainBestItemModel> itemsBest;

  const MainLoaded({
    required this.selectedCategory,
    required this.itemsHome,
    required this.itemsBest,
  });

  @override
  List<Object> get props => [selectedCategory, itemsHome, itemsBest];
}
