import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsServiceInterface.dart';

class ListingsService implements ListingsServiceInterface {
  Future<List<dynamic>> getBySearchValue(String searchValue) async {
    final url = 'http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&encoding=json&listing_type=buy&page=1&place_name=$searchValue';
    final response = await Dio().get(url);

    return json.decode(response.data)['response']['listings'];
  }
}