import 'package:mobx/mobx.dart';
part 'Listings.g.dart';

final apartmentInputKey = 'apartment';
class Listings = _Listings with _$Listings;

abstract class _Listings with Store {
  @observable
  ObservableList list = new ObservableList();

  @action
  void fetchListings(ObservableList newListings) {
    list = newListings;
  }
}