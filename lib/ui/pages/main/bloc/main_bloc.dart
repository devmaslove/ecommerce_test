import 'dart:math';

import 'package:ecommerce_test/data/data_provider.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_best_item_model.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_home_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainLoadEvent>((event, emit) async {
      emit(MainLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 2500));
        final mainData = await DataProvider().getMain();
        emit(
          MainLoaded(
            selectedCategory: 'Phones',
            itemsBest: mainData.bestSeller?.map(
                  (e) {
                    final priceWithoutDiscount = e.priceWithoutDiscount ?? 0;
                    final discountPrice = e.discountPrice ?? 0;
                    return MainBestItemModel(
                      picture: e.picture ?? '',
                      title: e.title ?? '',
                      price: max<int>(discountPrice, priceWithoutDiscount),
                      isFavorites: e.isFavorites ?? false,
                      priceWithDiscount:
                          min<int>(discountPrice, priceWithoutDiscount),
                    );
                  },
                ).toList() ??
                [],
            itemsHome: mainData.homeStore
                    ?.map(
                      (e) => MainHomeItemModel(
                        picture: e.picture ?? '',
                        subtitle: e.subtitle ?? '',
                        isNew: e.isNew ?? false,
                        isBuy: e.isBuy ?? false,
                        title: e.title ?? '',
                      ),
                    )
                    .toList() ??
                [],
          ),
        );
      } catch (e) {
        emit(MainErrorNetwork());
      }
    });
    on<MainSelectCategoryEvent>((event, emit) async {
      if (state is MainLoaded) {
        final loadedState = state as MainLoaded;
        emit(
          MainLoaded(
            itemsHome: [...loadedState.itemsHome],
            itemsBest: [...loadedState.itemsBest],
            selectedCategory: event.category,
          ),
        );
      }
    });
  }
}
