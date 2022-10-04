part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartErrorNetwork extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final String delivery;
  final int total;
  final List<CartItemModel> items;

  const CartLoaded({
    required this.delivery,
    required this.total,
    required this.items,
  });

  @override
  List<Object> get props => [
        delivery,
        total,
        items,
      ];

  CartLoaded copyWith({
    String? delivery,
    int? total,
    List<CartItemModel>? items,
  }) {
    return CartLoaded(
      delivery: delivery ?? this.delivery,
      total: total ?? this.total,
      items: items != null ? [...items] : [...this.items],
    );
  }
}
