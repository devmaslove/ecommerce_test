part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainLoadEvent extends MainEvent {
  const MainLoadEvent();

  @override
  List<Object> get props => [];
}

class MainSelectCategoryEvent extends MainEvent {
  final String category;

  const MainSelectCategoryEvent(this.category);

  @override
  List<Object> get props => [category];
}

class MainSetFilterEvent extends MainEvent {
  final MainFilterItemsModel filter;

  const MainSetFilterEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
