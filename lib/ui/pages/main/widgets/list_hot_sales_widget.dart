import 'package:flutter/material.dart';

class ListHotSalesWidget extends StatelessWidget {
  final List<Widget> children;

  const ListHotSalesWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: PageView(children: children),
    );
  }
}
