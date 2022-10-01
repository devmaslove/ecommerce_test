import 'package:dio/dio.dart';

class DioContainer {
  late final Dio dio;

  DioContainer() {
    final options = BaseOptions(
      baseUrl: 'https://run.mocky.io/v3',
    );
    dio = Dio(options);
  }
}
