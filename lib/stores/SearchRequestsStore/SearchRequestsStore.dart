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
  void filterListBySearchValue(String searchValue) {
    list = ObservableList.of(
        list
            .where((SearchRequestM listRequest) {
              return listRequest.searchValue != searchValue;
            })
            .toList()
    );
  }

  removeRequest(String searchValue) {
    filterListBySearchValue(searchValue);
    searchRequestsBox.put(requestFromSearch, list);
  }

  @action
  void add(SearchRequestM request) {
    Future.delayed(Duration(milliseconds: 200), () {
      request.searchValue = transformSearchValue(request.searchValue);

      filterListBySearchValue(request.searchValue);
      list.insert(0, request);
      searchRequestsBox.put(requestFromSearch, list);
    });
  }
}