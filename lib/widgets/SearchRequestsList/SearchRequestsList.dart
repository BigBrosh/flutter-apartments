import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/controllers/PagesController/PagesController.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
import 'package:nestoria_appartments/stores/globalStores.dart';

class SearchRequestsList extends StatelessWidget {
  Widget renderRequests(BuildContext context) {
    if (searchRequests.list.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Latest Searches: ',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: searchRequests.list.length,
            itemBuilder: (_, index) {
              SearchRequestM request = searchRequests.list[index];
              String searchValue = request.searchValue;
              int totalResults = request.totalResults;

              return GestureDetector(
                onTap: () async {
                  await listings.getBySearchValue(searchValue);
                  PagesController.goToSearchPage(context);
                },
                child: Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          Text(searchValue),
                          Text(totalResults.toString())
                        ],
                      ),
                    )
                ),
              );
            }
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => renderRequests(context));
  }
}
