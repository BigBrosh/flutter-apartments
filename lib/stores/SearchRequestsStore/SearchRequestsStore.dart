import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/hiveBoxes/searchRequestsBox.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';
part 'SearchRequestsStore.g.dart';

class SearchRequestsStore = _SearchRequestsStore with _$SearchRequestsStore;

abstract class _SearchRequestsStore with Store {
  @observable
  ObservableList<SearchRequestM> list = new ObservableList.of(searchRequestsBox.get(requestFromSearch).cast<SearchRequestM>());

  String transformSearchValue(String searchValue) {
    return searchValue.toLowerCase().trim();
  }

  @action
  void add(SearchRequestM request) {
    Future.delayed(Duration(milliseconds: 200), () {
      request.searchValue = transformSearchValue(request.searchValue);

      list = new ObservableList.of(
          list
            .where((SearchRequestM listRequest) => listRequest.searchValue != request.searchValue)
            .toList()
            ..insert(0, request)
      );

      searchRequestsBox.put(requestFromSearch, list);
    });
  }
}