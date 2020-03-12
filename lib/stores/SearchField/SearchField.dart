import 'package:mobx/mobx.dart';
part 'SearchField.g.dart';

class SearchField = _SearchField with _$SearchField;

abstract class _SearchField with Store {
  @observable
  String searchValue = '';

  @action
  void handleType(String text) {
    searchValue = text;
  }
}