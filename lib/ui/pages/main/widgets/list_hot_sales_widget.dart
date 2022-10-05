import 'package:flutter/material.dart';

class ListHotSalesWidget extends StatelessWidget {
  final List<Widget> children;

  const ListHotSalesWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 21,
        top: 8,
        bottom: 11,
      ),
      height: 182,
      child: PageView(children: children),
    );
  }
}
