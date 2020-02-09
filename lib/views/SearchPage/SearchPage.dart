import 'package:flutter/material.dart';
import 'package:nestoria_appartments/stores/Listings/Listings.dart';
import 'package:nestoria_appartments/widgets/ListingsList/ListingsList.dart';
import 'package:nestoria_appartments/widgets/SearchForm/SearchForm.dart';
import 'package:nestoria_appartments/widgets/SearchHeader/SearchHeader.dart';

final listings = Listings();

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PropertyCross'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SearchHeader(),
            SearchForm(listings),
            ListingsList(listings)
          ],
        ),
      ),
    );
  }
}