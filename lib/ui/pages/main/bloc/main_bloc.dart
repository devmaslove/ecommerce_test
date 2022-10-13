import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ecommerce_test/data/data_provider.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_best_item_model.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_filter_items_model.dart';
import 'package:ecommerce_test/ui/pages/main/models/main_home_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  static const _defaultCategory = 'Phones';

  MainBloc() : super(MainInitial()) {
    on<MainLoadEvent>((event, emit) async {
      emit(MainLoading());
      await Future.delayed(const Duration(milliseconds: 2500));
      await _tryLoadCategory(emit: emit, category: _defaultCategory);
    });
    on<MainSelectCategoryEvent>(
      (event, emit) async {
        emit(MainCategoryLoading(selectedCategory: event.category));
        if (event.category == _defaultCategory) {
          await _tryLoadCategory(emit: emit, category: _defaultCategory);
        } else {
          await Future.delayed(const Duration(milliseconds: 1000));
          emit(MainErrorNetwork(selectedCategory: event.category));
        }
      },
      transformer: restartable(),
    );
    on<MainSetFilterEvent>((event, emit) async {
      if (state is MainLoaded) {
        final loadedState = state as MainLoaded;
        emit(
          MainLoaded(
            itemsHome: [...loadedState.itemsHome],
            itemsBest: [...loadedState.itemsBest],
            selectedCategory: loadedState.selectedCategory,
            selectedFilter: event.filter,
          ),
        );
      }
    });
  }

  String _formatPrice(final int price) {
    final oCcy = NumberFormat("\$#,##0", "en_US");
    return oCcy.format(price);
  }

  Future<void> _tryLoadCategory({
    required Emitter<MainState> emit,
    required final String category,
  }) async {
    try {
      final mainData = await DataProvider().getMain();
      emit(
        MainLoaded(
          selectedFilter: const MainFilterItemsModel(),
          selectedCategory: _defaultCategory,
          itemsBest: mainData.bestSeller?.map(
                (e) {
                  final priceWithoutDiscount = e.priceWithoutDiscount ?? 0;
                  final discountPrice = e.discountPrice ?? 0;
                  final price = max<int>(
                    discountPrice,
                    priceWithoutDiscount,
                  );
                  final priceWithDiscount = min<int>(
                    discountPrice,
                    priceWithoutDiscount,
                  );
                  return MainBestItemModel(
                    picture: e.picture ?? '',
                    title: e.title ?? '',
                    price: _formatPrice(price),
                    isFavorites: e.isFavorites ?? false,
                    priceWithDiscount: _formatPrice(priceWithDiscount),
                    priceForFilter: priceWithDiscount,
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
      emit(const MainErrorNetwork(selectedCategory: _defaultCategory));
    }
  }
}
