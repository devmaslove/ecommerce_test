import 'package:ecommerce_test/data/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsLoadEvent>((event, emit) async {
      emit(DetailsLoading());
      try {
        final details = await DataProvider().getDetails();
        emit(
          DetailsLoaded(
            selectedColor: 0,
            selectedCapacity: 0,
            cpu: details.cpu ?? '',
            camera: details.camera ?? '',
            ssd: details.ssd ?? '',
            capacity: [...?details.capacity],
            color: [...?details.color],
            images: [...?details.images],
            isFavorites: details.isFavorites ?? false,
            price: details.price?.toDouble() ?? 0,
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
          isFavorites: !loadedState.isFavorites,
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
}
