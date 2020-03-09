import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
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
                    itemBuilder: (_, index) {
                      final SearchRequestM searchRequest = searchRequests.list[index];
                      final String searchValue = searchRequest.searchValue;

                      return Dismissible(
                        key: ObjectKey(searchValue),
                        child: new SearchRequest(searchRequest),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          searchRequests.removeRequest(searchValue);
                        },
                      );
                    }
                )
              ],
            );
          }
        );
      }
    );
  }
}
