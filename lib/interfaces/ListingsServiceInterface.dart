import 'package:location/location.dart';

abstract class ListingsServiceI {
  Future<Map<String, dynamic>> getBySearchValue(String searchValue);
  Future<Map<String, dynamic>> getByLocation(LocationData currentLocation);
  Future<Map<String, dynamic>> getByPage(int page);
}