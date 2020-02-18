import 'dart:convert';
import 'package:location/location.dart';
import 'package:nestoria_appartments/initializations/initDio.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsServiceInterface.dart';

class ListingsService implements ListingsServiceInterface {
  final String url = 'http://api.nestoria.co.uk/api';
  final Map<String, dynamic> basicParams = {
      'country': 'uk',
      'pretty': 1,
      'action': 'search_listings',
      'encoding': 'json',
      'listing_type': 'buy',
      'page': 1
  };
  Map<String, dynamic> additionalParams = {};

  Future<List<dynamic>> getBySearchValue(String searchValue) {
    additionalParams = {
      'page': 1,
      'place_name': searchValue
    };

    return fetchByUrl();
  }

  Future<List<dynamic>> getByLocation(LocationData currentLocation) {
    String latLng = '${currentLocation.latitude},${currentLocation.longitude}';
    additionalParams = {
      'page': 1,
      'centre_point': latLng
    };

    return fetchByUrl();
  }

  Future<List<dynamic>> fetchByUrl() async {
    final Map<String, dynamic> queryParameters = new Map.from(basicParams)..addAll(additionalParams);
    final response = await dio.get(url, queryParameters: queryParameters);

    return json.decode(response.data)['response']['listings'];
  }
}