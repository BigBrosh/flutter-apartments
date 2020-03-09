import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/stores/SearchRequestsStore/SearchRequestsStore.dart';
import 'package:nestoria_appartments/widgets/SearchRequest/SearchRequest.dart';
import 'package:provider/provider.dart';

class SearchRequestsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRequestsStore>(
      builder: (context, searchRequests, child) {
        return Observer(
          builder: (_) {
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
                    itemBuilder: (_, index) => new SearchRequest(searchRequests.list[index])
                )
              ],
            );
          }
        );
      }
    );
  }
}
