part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class DetailsLoadEvent extends DetailsEvent {
  const DetailsLoadEvent();

  @override
  List<Object> get props => [];
}

class DetailsToggleFavoriteEvent extends DetailsEvent {
  const DetailsToggleFavoriteEvent();

  @override
  List<Object> get props => [];
}
