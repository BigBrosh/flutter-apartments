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

  Future<List<dynamic>> getBySearchValue(String searchValue) {
    return fetchByUrl({ 'place_name': searchValue });
  }

  Future<List<dynamic>> getByLocation(LocationData currentLocation) {
    String latLng = '${currentLocation.latitude},${currentLocation.longitude}';
    return fetchByUrl({ 'centre_point': latLng });
  }

  Future<List<dynamic>> fetchByUrl(Map<String, dynamic> additional) async {
    final Map<String, dynamic> queryParameters = new Map.from(basicParams)..addAll(additional);
    final response = await dio.get(url, queryParameters: queryParameters);

    return json.decode(response.data)['response']['listings'];
  }
}