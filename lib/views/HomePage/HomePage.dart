import 'package:flutter/material.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsService.dart';
import 'package:nestoria_appartments/widgets/SearchForm/SearchForm.dart';
import 'package:nestoria_appartments/widgets/SearchHeader/SearchHeader.dart';
import 'package:nestoria_appartments/widgets/SearchRequestsList/SearchRequestsList.dart';

final listingsService = new ListingsService();

class HomePage extends StatelessWidget {
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
            SearchForm(),
            SizedBox(height: 28),
            SearchRequestsList()
          ],
        ),
      ),
    );
  }
}
