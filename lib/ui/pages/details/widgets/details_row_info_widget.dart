import 'package:ecommerce_test/ui/pages/details/widgets/details_info_widget.dart';
import 'package:ecommerce_test/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class DetailsRowInfoWidget extends StatelessWidget {
  final String cpu;
  final String camera;
  final String ssd;
  final String sd;

  const DetailsRowInfoWidget({
    super.key,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DetailsInfoWidget(
            text: cpu,
            imageWidth: 28,
            imageHeight: 28,
            imageAssetName: AppImages.cpu,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: camera,
            imageWidth: 28,
            imageHeight: 22,
            imageAssetName: AppImages.camera,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: ssd,
            imageWidth: 28,
            imageHeight: 21,
            imageAssetName: AppImages.ssd,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: sd,
            imageWidth: 19,
            imageHeight: 22,
            imageAssetName: AppImages.sd,
          ),
        ),
      ],
    );
  }
}
