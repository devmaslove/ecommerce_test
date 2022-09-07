import 'package:ecommerce_test/pages/details/widgets/details_title_widget.dart';
import 'package:ecommerce_test/resources/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

enum ProductColors { brown, black }

enum ProductCapacity { gb128, gb256 }

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  String selectedTab = 'Shop';
  ProductColors selectedColor = ProductColors.brown;
  ProductCapacity selectedCapacity = ProductCapacity.gb128;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          DetailsTitleWidget(
            onBack: () => Navigator.of(context).pop(),
            onCart: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 30),
          const Expanded(
            child: Center(child: Text('Images')),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowDetails.withOpacity(0.1),
                    offset: const Offset(0, -5),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Center(child: Text('Details')),
            ),
          ),
        ],
      ),
    );
  }
}
