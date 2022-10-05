class BasketData {
  int? id;
  String? images;
  int? price;
  String? title;

  BasketData({
    this.id,
    this.images,
    this.price,
    this.title,
  });

  BasketData.fromJson(dynamic json) {
    id = json['id'];
    images = json['images'];
    price = json['price'];
    title = json['title'];
  }

  @override
  String toString() {
    return 'Basket{id: $id, images: $images, price: $price, title: $title}';
  }
}
