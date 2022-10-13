import 'package:equatable/equatable.dart';

class MainFilterItemsModel extends Equatable {
  static const defaultBrand = 'Samsung';
  static const defaultPrice = '\$300 - \$500';
  static const _maxPrice = 999999;

  final String brand;
  final int priceBottom;
  final int priceTop;

  const MainFilterItemsModel({
    this.brand = '',
    this.priceBottom = 0,
    this.priceTop = _maxPrice,
  });

  bool get isFilterSet =>
      brand.isNotEmpty || priceBottom != 0 || priceTop != _maxPrice;

  String get price => priceBottom != 0 || priceTop != _maxPrice
      ? '\$$priceBottom - \$$priceTop'
      : '';

  String toFilterString() {
    if (!isFilterSet) return 'Filter';
    if (brand.isNotEmpty && price.isNotEmpty) return '$brand, $price';
    if (brand.isNotEmpty) return brand;
    return price;
  }

  @override
  List<Object?> get props => [
        brand,
        priceBottom,
        priceTop,
      ];

  MainFilterItemsModel copyWith({
    String? brand,
    int? priceBottom,
    int? priceTop,
  }) {
    return MainFilterItemsModel(
      brand: brand ?? this.brand,
      priceBottom: priceBottom ?? this.priceBottom,
      priceTop: priceTop ?? this.priceTop,
    );
  }
}
