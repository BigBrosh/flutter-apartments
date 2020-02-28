import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/controllers/SearchController/SearchController.dart';
import 'package:nestoria_appartments/stores/SearchField/SearchField.dart';
import 'package:nestoria_appartments/widgets/PrimaryButton/PrimaryButton.dart';

final searchField = new SearchField();

class SearchForm extends StatelessWidget {
  final _searchFormKey = GlobalKey<FormState>();

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

  Widget formButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: <Widget>[
        PrimaryButton(
          'Go',
          () => SearchController.getApartments(searchField.searchValue, context)
        ),
        PrimaryButton(
          'My Location',
          () => SearchController.getApartmentsByLocation(context)
        )
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