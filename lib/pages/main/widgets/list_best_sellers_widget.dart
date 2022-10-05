import 'package:flutter/material.dart';

class ListBestSellersWidget extends StatelessWidget {
  final List<Widget> children;

  const ListBestSellersWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 15,
        right: 21,
        top: 16,
        bottom: 22,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 14,
        mainAxisExtent: 227,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}
