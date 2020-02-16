import 'dart:convert';
import 'package:location/location.dart';
import 'package:nestoria_appartments/initializations/initDio.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsServiceInterface.dart';

class ListingsService implements ListingsServiceInterface {
  Future<List<dynamic>> getBySearchValue(String searchValue) {
    final url = 'http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&encoding=json&listing_type=buy&page=1&place_name=$searchValue';
    return fetchByUrl(url);
  }

  Future<List<dynamic>> getByLocation(LocationData currentLocation) {
    String latLng = '${currentLocation.latitude},${currentLocation.longitude}';
    final url = 'http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&encoding=json&listing_type=buy&page=1&centre_point=$latLng';

    return fetchByUrl(url);
  }

  Future<List<dynamic>> fetchByUrl(String url) async {
    final response = await dio.get(url);
    return json.decode(response.data)['response']['listings'];
  }
}