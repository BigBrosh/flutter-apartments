import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/models/Listing.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsService.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsServiceInterface.dart';
part 'Listings.g.dart';

final defaultService = new ListingsService();
class Listings = _Listings with _$Listings;

abstract class _Listings with Store {
  @observable
  ObservableList<ListingModel> list = new ObservableList();

  @action
  Future fetchListings(String searchValue, { ListingsServiceInterface listingsService }) async {
    final listings = await (listingsService ?? defaultService).getBySearchValue(searchValue);
    ObservableList<ListingModel> observableListings = new ObservableList.of(
        listings.map((i) => new ListingModel.fromJson(i)).toList()
    );

    list = observableListings;
  }
}