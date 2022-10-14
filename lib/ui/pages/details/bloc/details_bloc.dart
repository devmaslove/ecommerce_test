import 'package:ecommerce_test/data/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsLoadEvent>((event, emit) async {
      emit(DetailsLoading());
      try {
        final details = await DataProvider().getDetails();
        final colors = [...?details.color];
        final capacities = [...?details.capacity];
        emit(
          DetailsLoaded(
            selectedColor: 0,
            selectedCapacity: 0,
            cpu: details.cpu ?? '',
            camera: details.camera ?? '',
            ssd: details.ssd ?? '',
            capacities: capacities
                .map((capacity) => _formatCapacity(capacity))
                .toList(),
            colors: colors.map((color) => _parseColor(color)).toList(),
            images: [...?details.images],
            isFavorite: details.isFavorites ?? false,
            price: _formatPrice(details.price?.toDouble() ?? 0),
            title: details.title ?? '',
            rating: details.rating?.toDouble() ?? 0,
            sd: details.sd ?? '',
            countCart: 0,
          ),
        );
      } catch (e) {
        emit(DetailsErrorNetwork());
      }
    });
    on<DetailsToggleFavoriteEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(loadedState.copyWith(
          isFavorite: !loadedState.isFavorite,
        ));
      }
    });
    on<DetailsColorSelectEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(loadedState.copyWith(
          selectedColor: event.selectedColor,
        ));
      }
    });
    on<DetailsCapacitySelectEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(loadedState.copyWith(
          selectedCapacity: event.selectedCapacity,
        ));
      }
    });
    on<DetailsAddToCartEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(loadedState.copyWith(
          countCart: loadedState.countCart + 1,
        ));
      }
    });
  }

  String _formatPrice(final double price) {
    final oCcy = NumberFormat("\$#,##0", "en_US");
    return oCcy.format(price);
  }

  String _formatCapacity(final String capacity) {
    return '$capacity GB';
  }

  Color _parseColor(final String color) {
    final r = color.substring(1, 3);
    final g = color.substring(3, 5);
    final b = color.substring(5, 7);
    return Color.fromRGBO(
      int.parse(r, radix: 16),
      int.parse(g, radix: 16),
      int.parse(b, radix: 16),
      1.0,
    );
  }
}
