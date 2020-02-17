import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/widgets/ListingsList/ListingsList.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Listings')
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListingsList()
      )
    );
  }
}