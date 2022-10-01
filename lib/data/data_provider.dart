import 'package:ecommerce_test/data/dio_container.dart';
import 'package:ecommerce_test/data/models/details_data.dart';

class DataProvider {
  final DioContainer _dioContainer = DioContainer();

  static DataProvider? _instance;
  factory DataProvider() => _instance ??= DataProvider._();
  DataProvider._();

  Future<DetailsData> getDetails() async {
    final response = await _dioContainer.dio.get(
      '/6c14c560-15c6-4248-b9d2-b4508df7d4f5',
    );
    return DetailsData.fromJson(response.data);
  }
}