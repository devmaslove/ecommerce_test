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

class DetailsColorSelectEvent extends DetailsEvent {
  final int selectedColor;

  const DetailsColorSelectEvent(this.selectedColor);

  @override
  List<Object> get props => [selectedColor];
}

class DetailsCapacitySelectEvent extends DetailsEvent {
  final int selectedCapacity;

  const DetailsCapacitySelectEvent(this.selectedCapacity);

  @override
  List<Object> get props => [selectedCapacity];
}
