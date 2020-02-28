import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/interfaces/PaginationServiceI.dart';
import 'package:nestoria_appartments/models/Listing.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsService.dart';
import 'package:nestoria_appartments/interfaces/ListingsServiceInterface.dart';
part 'Listings.g.dart';

final defaultService = new ListingsService();
class Listings = _Listings with _$Listings;

abstract class _Listings with Store implements PaginationServiceI {
  ListingsServiceI listingsService;

  _Listings([service]) {
    this.listingsService = service ?? defaultService;
  }

  @observable
  ObservableList<ListingModel> list = new ObservableList();
  int maxPages = 1;
  int totalResults = 0;

  Future<Map<String, dynamic>> getBySearchValue(String searchValue) async {
    final listings = await this.listingsService.getBySearchValue(searchValue);
    return fetchListings(listings);
  }

  Future<Map<String, dynamic>> getByCurrentLocation(LocationData currentLocation) async {
    final listings = await this.listingsService.getByLocation(currentLocation);
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