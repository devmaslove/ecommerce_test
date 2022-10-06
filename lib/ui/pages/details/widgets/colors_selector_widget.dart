import 'package:flutter/material.dart';

class ColorsSelectorWidget extends StatelessWidget {
  final int selectedColor;
  final List<Color> colors;
  final ValueChanged<int> onSelect;

  const ColorsSelectorWidget({
    super.key,
    required this.selectedColor,
    required this.colors,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      children: [
        for (int i = 0; i < colors.length; i++)
          _ColorWidget(
            color: colors[i],
            selected: selectedColor == i,
            onTap: () => onSelect(i),
          ),
      ],
    );
  }
}

class _ColorWidget extends StatelessWidget {
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _ColorWidget({
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 40,
          height: 40,
          child: selected
              ? const Icon(
                  Icons.check,
                  size: 24,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
