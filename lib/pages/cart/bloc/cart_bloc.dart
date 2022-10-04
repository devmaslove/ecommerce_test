import 'package:ecommerce_test/data/data_provider.dart';
import 'package:ecommerce_test/pages/cart/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartLoadEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await DataProvider().getCart();
        emit(
          CartLoaded(
            delivery: cart.delivery ?? 'free',
            total: cart.total ?? 0,
            items: cart.basket
                    ?.map(
                      (e) => CartItemModel(
                        title: e.title ?? '',
                        images: e.images ?? '',
                        price: e.price ?? 0,
                      ),
                    )
                    .toList() ??
                [],
          ),
        );
      } catch (e) {
        emit(CartErrorNetwork());
      }
    });
    on<CartRemoveItemEvent>((event, emit) async {
      if (state is CartLoaded) {
        final loadedState = state as CartLoaded;
        final items = [...loadedState.items];
        items.removeAt(event.index);
        emit(loadedState.copyWith(
          items: items,
        ));
      }
    });
  }
}
