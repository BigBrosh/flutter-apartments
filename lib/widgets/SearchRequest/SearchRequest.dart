import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
import 'package:nestoria_appartments/stores/ListingsStore/ListingsStore.dart';
import 'package:provider/provider.dart';

class SearchRequest extends StatelessWidget {
  final SearchRequestM searchRequest;

  SearchRequest(this.searchRequest);

  @override
  Widget build(BuildContext context) {
    String searchValue = searchRequest.searchValue;
    int totalResults = searchRequest.totalResults;

    return Consumer<ListingsStore>(
      builder: (context, listings, child) {
        return GestureDetector(
          onTap: () => listings.getBySearchValue(searchValue, context),
          child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          Text(searchValue),
                          Text(totalResults.toString())
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      }
    );
  }
}