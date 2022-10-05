class HomeStoreData {
  int? id;
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  bool? isBuy;

  HomeStoreData({
    this.id,
    this.isNew,
    this.title,
    this.subtitle,
    this.picture,
    this.isBuy,
  });

  HomeStoreData.fromJson(dynamic json) {
    id = json['id'];
    isNew = json['is_new'];
    title = json['title'];
    subtitle = json['subtitle'];
    picture = json['picture'];
    isBuy = json['is_buy'];
  }

  @override
  String toString() {
    return 'HomeStoreData{id: $id, isNew: $isNew, title: $title, subtitle: $subtitle, picture: $picture, isBuy: $isBuy}';
  }
}
