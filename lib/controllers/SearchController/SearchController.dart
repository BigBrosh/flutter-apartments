import 'package:flutter/material.dart';
import 'package:nestoria_appartments/controllers/PagesController/PagesController.dart';
import 'package:location/location.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
import 'package:nestoria_appartments/stores/globalStores.dart';

final location = new Location();

class SearchController {
  static Future<void> getApartments(String searchValue, BuildContext context) async {
    Map<String, dynamic> response = await listings.getBySearchValue(searchValue);

    searchRequests.add(SearchRequestM.fromJson({
      'searchValue': searchValue,
      'totalResults': response['total_results']
    }));
    PagesController.goToSearchPage(context);
  }

  static Future<void> getApartmentsByLocation(BuildContext context) async {
    LocationData currentLocation = await location.getLocation();
    listings.getByCurrentLocation(currentLocation);
    PagesController.goToSearchPage(context);
  }
}