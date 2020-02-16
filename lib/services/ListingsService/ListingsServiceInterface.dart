import 'package:location/location.dart';

abstract class ListingsServiceInterface {
  Future<List<dynamic>> getBySearchValue(String searchValue);
  Future<List<dynamic>> getByLocation(LocationData currentLocation);
}