import 'package:mobx/mobx.dart';
import 'package:nestoria_appartments/hiveBoxes/formBox.dart';
part 'SearchField.g.dart';

class SearchField = _SearchField with _$SearchField;

abstract class _SearchField with Store {
  @observable
  String searchValue =
    apartmentSearchForm.get(apartmentInputKey, defaultValue: '');

  @action
  void handleType(String text) {
    searchValue = text;
    apartmentSearchForm.put(apartmentInputKey, text);
  }
}