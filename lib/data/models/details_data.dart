class DetailsData {
  String? cpu;
  String? camera;
  List<String>? capacity;
  List<String>? color;
  String? id;
  List<String>? images;
  bool? isFavorites;
  num? price;
  num? rating;
  String? sd;
  String? ssd;
  String? title;

  DetailsData({
    this.cpu,
    this.camera,
    this.capacity,
    this.color,
    this.id,
    this.images,
    this.isFavorites,
    this.price,
    this.rating,
    this.sd,
    this.ssd,
    this.title,
  });

  DetailsData.fromJson(dynamic json) {
    cpu = json['CPU'];
    camera = json['camera'];
    capacity = json['capacity'] != null ? json['capacity'].cast<String>() : [];
    color = json['color'] != null ? json['color'].cast<String>() : [];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    isFavorites = json['isFavorites'];
    price = json['price'];
    rating = json['rating'];
    sd = json['sd'];
    ssd = json['ssd'];
    title = json['title'];
  }

  @override
  String toString() {
    return 'DetailsData{cpu: $cpu, camera: $camera, capacity: $capacity, color: $color, id: $id, images: $images, isFavorites: $isFavorites, price: $price, rating: $rating, sd: $sd, ssd: $ssd, title: $title}';
  }
}
