import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/views/SearchPage/SearchPage.dart';

class PagesController {
  static void goToSearchPage(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(
      new CupertinoPageRoute<bool>(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }
}