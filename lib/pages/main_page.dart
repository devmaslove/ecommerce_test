import 'package:ecommerce_test/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppImages.filter,
              width: 11,
              height: 13,
            ),
            tooltip: 'Open filter',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
