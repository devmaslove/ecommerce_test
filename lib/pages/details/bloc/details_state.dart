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

class DetailsErrorNetwork extends DetailsState {
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

  DetailsLoaded copyWith({
    String? cpu,
    String? camera,
    List<String>? capacity,
    List<String>? color,
    List<String>? images,
    bool? isFavorites,
    double? price,
    double? rating,
    String? sd,
    String? ssd,
    String? title,
    int? selectedColor,
    int? selectedCapacity,
  }) {
    return DetailsLoaded(
      cpu: cpu ?? this.cpu,
      camera: camera ?? this.camera,
      capacity: capacity != null ? [...capacity] : [...this.capacity],
      color: color != null ? [...color] : [...this.color],
      images: images != null ? [...images] : [...this.images],
      isFavorites: isFavorites ?? this.isFavorites,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      sd: sd ?? this.sd,
      ssd: ssd ?? this.ssd,
      title: title ?? this.title,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedCapacity: selectedCapacity ?? this.selectedCapacity,
    );
  }
}
