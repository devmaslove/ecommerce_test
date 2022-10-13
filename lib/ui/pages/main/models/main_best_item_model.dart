import 'package:equatable/equatable.dart';

class MainBestItemModel extends Equatable {
  final bool isFavorites;
  final String title;
  final String picture;
  final String price;
  final String priceWithDiscount;
  final int priceForFilter;

  const MainBestItemModel({
    required this.isFavorites,
    required this.title,
    required this.picture,
    required this.price,
    required this.priceWithDiscount,
    required this.priceForFilter,
  });

  @override
  List<Object?> get props => [
        isFavorites,
        title,
        picture,
        price,
        priceWithDiscount,
        priceForFilter,
      ];
}
