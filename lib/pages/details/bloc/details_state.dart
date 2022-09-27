part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  @override
  List<Object> get props => [];
}

class DetailsLoading extends DetailsState {
  @override
  List<Object> get props => [];
}

class DetailsLoaded extends DetailsState {
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  final bool isFavorites;
  final double price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;
  final int selectedColor;
  final int selectedCapacity;

  const DetailsLoaded({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
    required this.selectedColor,
    required this.selectedCapacity,
  });

  @override
  List<Object> get props => [
        cpu,
        camera,
        capacity,
        color,
        images,
        isFavorites,
        price,
        rating,
        sd,
        ssd,
        title,
        selectedColor,
        selectedCapacity,
      ];
}
