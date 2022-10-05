import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String images;
  final int price;
  final String title;

  const CartItemModel({
    required this.images,
    required this.price,
    required this.title,
  });

  @override
  List<Object?> get props => [images, price, title];
}
