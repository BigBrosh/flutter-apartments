import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/models/Listing.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsService.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsServiceInterface.dart';
part 'Listings.g.dart';

final defaultService = new ListingsService();
class Listings = _Listings with _$Listings;

abstract class _Listings with Store {
  ListingsServiceInterface listingsService;

  _Listings([service]) {
    this.listingsService = service ?? defaultService;
  }

  @observable
  ObservableList<ListingModel> list = new ObservableList();

  Future getBySearchValue(String searchValue) async {
    final listings = await this.listingsService.getBySearchValue(searchValue);
    fetchListings(listings);
  }

  Future getByCurrentLocation(LocationData currentLocation) async {
    final listings = await this.listingsService.getByLocation(currentLocation);
    fetchListings(listings);
  }

  @action
  void fetchListings(List<dynamic> listings) {
    ObservableList<ListingModel> observableListings = new ObservableList.of(
        listings.map((i) => new ListingModel.fromJson(i)).toList()
    );

    list = observableListings;
  }
}