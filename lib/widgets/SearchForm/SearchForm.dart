import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/stores/SearchField/SearchField.dart';
import 'package:location/location.dart';
import 'package:nestoria_appartments/widgets/PrimaryButton/PrimaryButton.dart';

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

  void searchApartments() {
    listings.getBySearchValue(searchField.searchValue);
  }

  void searchApartmentsByLocation() async {
    LocationData currentLocation = await location.getLocation();
    listings.getByCurrentLocation(currentLocation);
  }

  Widget formButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: <Widget>[
        PrimaryButton('Go', searchApartments),
        PrimaryButton('My Location', searchApartmentsByLocation)
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