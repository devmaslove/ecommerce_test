import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsLoadEvent>((event, emit) async {
      emit(DetailsLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(const DetailsLoaded(
        cpu: 'Exynos 990',
        camera: '108 + 12 mp',
        selectedColor: 0,
        selectedCapacity: 0,
        ssd: '8 GB',
        capacity: [
          "126",
          "252",
        ],
        color: [
          "#772D03",
          "#010035",
        ],
        images: [
          "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
          "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
        ],
        isFavorites: true,
        selectedTab: 0,
        price: 1500,
        title: 'Galaxy Note 20 Ultra',
        rating: 4.5,
        sd: '256 GB',
      ));
    });
    on<DetailsToggleFavoriteEvent>((event, emit) async {
      if (state is DetailsLoaded) {
        final loadedState = state as DetailsLoaded;
        emit(DetailsLoaded(
          cpu: loadedState.cpu,
          camera: loadedState.camera,
          selectedColor: loadedState.selectedColor,
          selectedCapacity: loadedState.selectedCapacity,
          ssd: loadedState.ssd,
          capacity: [...loadedState.capacity],
          color: [...loadedState.color],
          images: [...loadedState.images],
          isFavorites: !loadedState.isFavorites,
          selectedTab: loadedState.selectedTab,
          price: loadedState.price,
          title: loadedState.title,
          rating: loadedState.rating,
          sd: loadedState.sd,
        ));
      }
    });
  }
}
