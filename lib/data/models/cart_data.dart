import 'basket_data.dart';

class CartData {
  List<Basket>? basket;
  String? delivery;
  String? id;
  int? total;

  CartData({
    this.basket,
    this.delivery,
    this.id,
    this.total,
  });

  CartData.fromJson(dynamic json) {
    if (json['basket'] != null) {
      basket = [];
      json['basket'].forEach((v) {
        basket!.add(Basket.fromJson(v));
      });
    }
    delivery = json['delivery'];
    id = json['id'];
    total = json['total'];
  }

  @override
  String toString() {
    return 'CartData{basket: $basket, delivery: $delivery, id: $id, total: $total}';
  }
}
