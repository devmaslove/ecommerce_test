class BestSellerData {
  int? id;
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;

  BestSellerData({
    this.id,
    this.isFavorites,
    this.title,
    this.priceWithoutDiscount,
    this.discountPrice,
    this.picture,
  });

  BestSellerData.fromJson(dynamic json) {
    id = json['id'];
    isFavorites = json['is_favorites'];
    title = json['title'];
    priceWithoutDiscount = json['price_without_discount'];
    discountPrice = json['discount_price'];
    picture = json['picture'];
  }

  @override
  String toString() {
    return 'BestSellerData{id: $id, isFavorites: $isFavorites, title: $title, priceWithoutDiscount: $priceWithoutDiscount, discountPrice: $discountPrice, picture: $picture}';
  }
}
