import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/stores/SearchField/SearchField.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

final searchField = SearchField();
final location = new Location();

class SearchForm extends StatelessWidget {
  final listings;
  final _searchFormKey = GlobalKey<FormState>();

  SearchForm(this.listings);

  Widget renderSearchField() {
    return TextFormField(
      initialValue: searchField.searchValue,
      onChanged: searchField.handleType,
      decoration: const InputDecoration(
        hintText: 'Start typing apartment name',
        isDense: true
      ),
    );
  }

  Widget primaryButton(String title, BuildContext context, Function action) {
    return (
        RaisedButton(
            child: Text(title),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: action
        )
    );
  }

  void searchApartments() async {
    String url = 'http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&encoding=json&listing_type=buy&page=1&place_name=${searchField.searchValue}';
    final response = await http.get(url);
    final apartments = json.decode(response.body);
    final newListings = new ObservableList.of(apartments['response']['listings']);
    listings.fetchListings(newListings);
    print('apartments: $newListings');
  }

  void searchApartmentsByLocation() async {
    try {
      LocationData currentLocation = await location.getLocation();
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      print(currentLocation.accuracy);
      print(currentLocation.heading);
      print(currentLocation.time);
    } catch (e) {
      print('error $e');
    }
  }

  Widget formButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: <Widget>[
        primaryButton('Go', context, searchApartments),
        primaryButton('My Location', context, searchApartmentsByLocation)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _searchFormKey,
      child: Wrap(
        runSpacing: 8,
        children: <Widget>[
          renderSearchField(),
          formButtons(context)
        ],
      ),
    );
  }
}