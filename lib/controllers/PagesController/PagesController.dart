import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/models/Listing.dart';
import 'package:nestoria_appartments/views/ListingPage/ListingPage.dart';
import 'package:nestoria_appartments/views/SearchPage/SearchPage.dart';

class PagesController {
  static void goToSearchPage(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(
      new CupertinoPageRoute(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }

  static void goToListing(BuildContext context, ListingModel listing) {
    Navigator.of(context, rootNavigator: true).push(
      new CupertinoPageRoute(
        builder: (BuildContext context) => ListingPage(),
        settings: RouteSettings(
          arguments: listing,
        )
      )
    );
  }
}