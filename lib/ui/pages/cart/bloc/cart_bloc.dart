import 'package:ecommerce_test/data/data_provider.dart';
import 'package:ecommerce_test/ui/pages/cart/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
            total: _formatTotal(cart.total ?? 0),
            items: cart.basket
                    ?.map(
                      (e) => CartItemModel(
                        title: e.title ?? '',
                        images: e.images ?? '',
                        priceValue: e.price ?? 0,
                        price: _formatPrice(e.price ?? 0),
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
        final total = items.fold<int>(0, (sum, item) => sum + item.priceValue);
        emit(loadedState.copyWith(
          items: items,
          total: _formatTotal(total),
        ));
      }
    });
  }

  String _formatTotal(final int total) {
    final oCcy = NumberFormat("\$#,##0 us", "en_US");
    return oCcy.format(total);
  }

  String _formatPrice(final int price) {
    return '\$${price.toDouble().toStringAsFixed(2)}';
  }
}
