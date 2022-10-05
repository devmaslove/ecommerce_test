import 'package:equatable/equatable.dart';

class MainBestItemModel extends Equatable {
  final bool isFavorites;
  final String title;
  final String picture;
  final int price;
  final int priceWithDiscount;

  const MainBestItemModel({
    required this.isFavorites,
    required this.title,
    required this.picture,
    required this.price,
    required this.priceWithDiscount,
  });

  @override
  List<Object?> get props => [
        isFavorites,
        title,
        picture,
        price,
        priceWithDiscount,
      ];
}
