import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String title;
  final String images;
  final String price;
  final int priceValue;

  const CartItemModel({
    required this.images,
    required this.priceValue,
    required this.price,
    required this.title,
  });

  @override
  List<Object?> get props => [images, price, priceValue, title];
}
