import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/models/Listing.dart';
part 'Listings.g.dart';

final apartmentInputKey = 'apartment';
class Listings = _Listings with _$Listings;

abstract class _Listings with Store {
  @observable
  ObservableList<ListingModel> list = new ObservableList();

  @action
  void fetchListings(ObservableList newListings) {
    list = newListings;
  }
}