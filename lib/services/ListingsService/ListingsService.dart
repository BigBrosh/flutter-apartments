import 'dart:convert';
import 'package:location/location.dart';
import 'package:nestoria_appartments/initializations/initDio.dart';
import 'package:nestoria_appartments/interfaces/ListingsServiceInterface.dart';

class ListingsService implements ListingsServiceI {
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

  Future<Map<String, dynamic>> getBySearchValue(String searchValue) {
    additionalParams = {
      'page': 1,
      'place_name': searchValue
    };

    return fetchByUrl();
  }

  Future<Map<String, dynamic>> getByLocation(LocationData currentLocation) {
    String latLng = '${currentLocation.latitude},${currentLocation.longitude}';
    additionalParams = {
      'page': 1,
      'centre_point': latLng
    };

    return fetchByUrl();
  }

  Future<Map<String, dynamic>> getByPage(int page) {
    additionalParams['page'] = page;
    return fetchByUrl();
  }

  Future<Map<String, dynamic>> fetchByUrl() async {
    final Map<String, dynamic> queryParameters = new Map.from(basicParams)..addAll(additionalParams);
    final response = await dio.get(url, queryParameters: queryParameters);

    return {
      'list': json.decode(response.data)['response']['listings'],
      'maxPages': json.decode(response.data)['response']['total_pages']
    };
  }
}