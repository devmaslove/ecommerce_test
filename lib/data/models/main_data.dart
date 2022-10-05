import 'package:ecommerce_test/data/models/best_seller_data.dart';
import 'package:ecommerce_test/data/models/home_store_data.dart';

class MainData {
  List<HomeStoreData>? homeStore;
  List<BestSellerData>? bestSeller;

  MainData({
    this.homeStore,
    this.bestSeller,
  });

  MainData.fromJson(dynamic json) {
    if (json['home_store'] != null) {
      homeStore = [];
      json['home_store'].forEach((v) {
        homeStore!.add(HomeStoreData.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      bestSeller = [];
      json['best_seller'].forEach((v) {
        bestSeller!.add(BestSellerData.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'MainData{homeStore: $homeStore, bestSeller: $bestSeller}';
  }
}
