import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/stores/ListingsStore/ListingsStore.dart';
import 'package:nestoria_appartments/stores/SearchField/SearchField.dart';
import 'package:nestoria_appartments/widgets/PrimaryButton/PrimaryButton.dart';
import 'package:provider/provider.dart';

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
    final listingsProvider = Provider.of<ListingsStore>(context, listen: false);

    return Wrap(
      spacing: 16,
      children: <Widget>[
        PrimaryButton(
          'Go',
          () => listingsProvider.getBySearchValue(searchField.searchValue, context)
        ),
        PrimaryButton(
          'My Location',
          () => listingsProvider.getByCurrentLocation(context)
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