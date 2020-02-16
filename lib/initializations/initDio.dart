import 'package:dio/dio.dart';

final dio = Dio();

void initDio(loadStore) {
  dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        loadStore.loadingOn();
        return options;
      },
      onResponse:(Response response) async {
        loadStore.loadingOff();
        return response;
      }
  ));
}