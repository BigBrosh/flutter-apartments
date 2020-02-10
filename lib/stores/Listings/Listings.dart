import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/models/Listing.dart';
part 'Listings.g.dart';

class Listings = _Listings with _$Listings;

abstract class _Listings with Store {
  @observable
  ObservableList<ListingModel> list = new ObservableList();

  @action
  Future fetchListings(String searchValue) async {
    String url = 'http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&encoding=json&listing_type=buy&page=1&place_name=$searchValue';
    final response = await Dio().get(url);
    final decoded = json.decode(response.data)['response']['listings'];
    ObservableList<ListingModel> observableListings = new ObservableList.of(
        (decoded as List).map((i) => new ListingModel.fromJson(i)).toList()
    );

    list = observableListings;
  }
}