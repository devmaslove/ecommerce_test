import 'package:ecommerce_test/ui/pages/main/bloc/main_bloc.dart';
import 'package:ecommerce_test/ui/pages/main/main_page_category_loading.dart';
import 'package:ecommerce_test/ui/pages/main/main_page_load_error.dart';
import 'package:ecommerce_test/ui/pages/main/main_page_loaded.dart';
import 'package:ecommerce_test/ui/pages/main/main_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc()..add(const MainLoadEvent()),
      child: const MainPageContent(),
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoading) {
          return const MainPageLoading();
        }
        if (state is MainCategoryLoading) {
          return MainPageCategoryLoading(
            selectedCategory: state.selectedCategory,
          );
        }
        if (state is MainErrorNetwork) {
          return MainPageLoadError(
            selectedCategory: state.selectedCategory,
            onRetry: () {
              final bloc = context.read<MainBloc>();
              bloc.add(MainSelectCategoryEvent(state.selectedCategory));
            },
            onSelectCategory: (category) {
              final bloc = context.read<MainBloc>();
              bloc.add(MainSelectCategoryEvent(category));
            },
          );
        }
        if (state is MainLoaded) {
          return MainPageLoaded(state);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
