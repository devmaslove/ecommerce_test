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
  final List<String> capacities;
  final List<Color> colors;
  final List<String> images;
  final bool isFavorites;
  final String price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;
  final int selectedColor;
  final int selectedCapacity;
  final int countCart;

  const DetailsLoaded({
    required this.cpu,
    required this.camera,
    required this.capacities,
    required this.colors,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
    required this.selectedColor,
    required this.selectedCapacity,
    required this.countCart,
  });

  @override
  List<Object> get props => [
        cpu,
        camera,
        capacities,
        colors,
        images,
        isFavorites,
        price,
        rating,
        sd,
        ssd,
        title,
        selectedColor,
        selectedCapacity,
        countCart,
      ];

  DetailsLoaded copyWith({
    String? cpu,
    String? camera,
    List<String>? capacities,
    List<Color>? colors,
    List<String>? images,
    bool? isFavorites,
    String? price,
    double? rating,
    String? sd,
    String? ssd,
    String? title,
    int? selectedColor,
    int? selectedCapacity,
    int? countCart,
  }) {
    return DetailsLoaded(
      cpu: cpu ?? this.cpu,
      camera: camera ?? this.camera,
      capacities: capacities != null ? [...capacities] : [...this.capacities],
      colors: colors != null ? [...colors] : [...this.colors],
      images: images != null ? [...images] : [...this.images],
      isFavorites: isFavorites ?? this.isFavorites,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      sd: sd ?? this.sd,
      ssd: ssd ?? this.ssd,
      title: title ?? this.title,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedCapacity: selectedCapacity ?? this.selectedCapacity,
      countCart: countCart ?? this.countCart,
    );
  }
}
