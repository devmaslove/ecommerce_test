import 'package:ecommerce_test/ui/resources/app_colors.dart';
import 'package:ecommerce_test/ui/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class HotSaleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picture;
  final bool isNew;
  final VoidCallback? onBuy;
  final double height;

  const HotSaleWidget({
    super.key,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isNew,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            left: 100,
            right: -100,
            top: -8,
            bottom: -32,
            child: Image.network(
              picture,
              alignment: Alignment.centerRight,
              fit: BoxFit.fitHeight,
              errorBuilder: (_, __, ___) {
                return const SizedBox.shrink();
              },
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black87,
                  Colors.black26,
                  Colors.transparent,
                ],
                stops: [0.0, 0.4, 0.6, 1.0],
              ),
            ),
          ),
          if (onBuy != null)
            Positioned(
              left: 24,
              bottom: 24,
              height: 28,
              child: ElevatedButton(
                onPressed: onBuy,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                ),
                child: Text(
                  'Buy now!',
                  style: const AppTextStyle().copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 11,
                    height: 13 / 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          Positioned.fill(
            left: 24,
            top: 48,
            bottom: 56,
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      title,
                      style: const AppTextStyle().copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 24,
                        height: 30 / 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    child: Text(
                      subtitle,
                      style: const AppTextStyle().copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 11,
                        height: 13 / 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          if (isNew)
            Positioned(
              left: 24,
              top: 24,
              child: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'New',
                  style: const AppTextStyle().copyWith(
                    fontFamily: 'SF Pro Display',
                    fontSize: 10,
                    height: 12 / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
