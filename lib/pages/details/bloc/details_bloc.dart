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
          ),
        );
      } catch (e) {
        emit(DetailsErrorNetwork());
      }
    });
    on<DetailsToggleFavoriteEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(
          DetailsLoaded(
            cpu: loadedState.cpu,
            camera: loadedState.camera,
            selectedColor: loadedState.selectedColor,
            selectedCapacity: loadedState.selectedCapacity,
            ssd: loadedState.ssd,
            capacity: [...loadedState.capacity],
            color: [...loadedState.color],
            images: [...loadedState.images],
            isFavorites: !loadedState.isFavorites,
            price: loadedState.price,
            title: loadedState.title,
            rating: loadedState.rating,
            sd: loadedState.sd,
          ),
        );
      }
    });
    on<DetailsColorSelectEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(
          DetailsLoaded(
            cpu: loadedState.cpu,
            camera: loadedState.camera,
            selectedColor: event.selectedColor,
            selectedCapacity: loadedState.selectedCapacity,
            ssd: loadedState.ssd,
            capacity: [...loadedState.capacity],
            color: [...loadedState.color],
            images: [...loadedState.images],
            isFavorites: loadedState.isFavorites,
            price: loadedState.price,
            title: loadedState.title,
            rating: loadedState.rating,
            sd: loadedState.sd,
          ),
        );
      }
    });
    on<DetailsCapacitySelectEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(
          DetailsLoaded(
            cpu: loadedState.cpu,
            camera: loadedState.camera,
            selectedColor: loadedState.selectedColor,
            selectedCapacity: event.selectedCapacity,
            ssd: loadedState.ssd,
            capacity: [...loadedState.capacity],
            color: [...loadedState.color],
            images: [...loadedState.images],
            isFavorites: loadedState.isFavorites,
            price: loadedState.price,
            title: loadedState.title,
            rating: loadedState.rating,
            sd: loadedState.sd,
          ),
        );
      }
    });
  }
}
