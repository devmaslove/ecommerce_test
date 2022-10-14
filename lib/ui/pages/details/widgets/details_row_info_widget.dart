import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ecommerce_test/ui/pages/details/widgets/details_info_widget.dart';
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
            icon: BootstrapIcons.cpu,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: camera,
            icon: BootstrapIcons.camera,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: ssd,
            icon: BootstrapIcons.memory,
          ),
        ),
        Expanded(
          child: DetailsInfoWidget(
            text: sd,
            icon: BootstrapIcons.sd_card,
          ),
        ),
      ],
    );
  }
}
