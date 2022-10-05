import 'package:ecommerce_test/ui/pages/main/bloc/main_bloc.dart';
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
        if (state is MainErrorNetwork) {
          return MainPageLoadError(
            onRetry: () {
              final bloc = context.read<MainBloc>();
              bloc.add(const MainLoadEvent());
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
