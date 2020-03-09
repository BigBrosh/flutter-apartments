import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/interfaces/PaginationServiceI.dart';
import 'package:nestoria_appartments/models/Listing.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
import 'package:nestoria_appartments/interfaces/ListingsServiceInterface.dart';
import 'package:nestoria_appartments/controllers/PagesController/PagesController.dart';
import 'package:nestoria_appartments/stores/SearchRequestsStore/SearchRequestsStore.dart';
part 'ListingsStore.g.dart';

final location = new Location();
class ListingsStore = _ListingsStore with _$ListingsStore;

abstract class _ListingsStore with Store implements PaginationServiceI {
  ListingsServiceI listingsService;
  SearchRequestsStore searchRequests;

  _ListingsStore(this.listingsService, this.searchRequests);

  @observable
  ObservableList<ListingModel> list = new ObservableList();
  int maxPages = 1;
  int totalResults = 0;

  Future<Map<String, dynamic>> getBySearchValue(String searchValue, BuildContext context) async {
    final response = await this.listingsService.getBySearchValue(searchValue);

    searchRequests.add(SearchRequestM.fromJson({
      'searchValue': searchValue,
      'totalResults': response['total_results']
    }));

    PagesController.goToSearchPage(context);

    return fetchListings(response);
  }

  Future<Map<String, dynamic>> getByCurrentLocation(BuildContext context) async {
    LocationData currentLocation = await location.getLocation();
    final listings = await this.listingsService.getByLocation(currentLocation);

    PagesController.goToSearchPage(context);

    return fetchListings(listings);
  }

  Future refresh() {
    list = new ObservableList();
    return fetchByPage(1);
  }

  @action
  Future fetchByPage(int page) async {
    final listings = await this.listingsService.getByPage(page);
    list.addAll(transformToListingModel(listings['list']));
  }

  @action
  Map<String, dynamic> fetchListings(Map<String, dynamic> listings) {
    list = transformToListingModel(listings['list']);
    maxPages = listings['response']['total_pages'];

    return listings['response'];
  }

  ObservableList<ListingModel> transformToListingModel(List<dynamic> listings) {
    return new ObservableList.of(
        listings.map((i) => new ListingModel.fromJson(i)).toList()
    );
  }
}