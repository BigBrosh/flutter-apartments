import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/hiveBoxes/searchRequestsBox.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
part 'SearchRequests.g.dart';

class SearchRequests = _SearchRequests with _$SearchRequests;

abstract class _SearchRequests with Store {
  @observable
  List<SearchRequestM> list = searchRequestsBox.get(requestFromSearch).cast<SearchRequestM>();

  String transformSearchValue(String searchValue) {
    return searchValue.toLowerCase().trim();
  }

  @action
  void add(SearchRequestM request) {
    Future.delayed(Duration(milliseconds: 200), () {
      request.searchValue = transformSearchValue(request.searchValue);

      list = list
          .where((SearchRequestM listRequest) => listRequest.searchValue != request.searchValue)
          .toList()
          ..insert(0, request);

      searchRequestsBox.put(requestFromSearch, list);
    });
  }
}