part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartLoadEvent extends CartEvent {
  const CartLoadEvent();

  @override
  List<Object> get props => [];
}

class CartRemoveItemEvent extends CartEvent {
  final int index;

  const CartRemoveItemEvent(this.index);

  @override
  List<Object> get props => [index];
}
