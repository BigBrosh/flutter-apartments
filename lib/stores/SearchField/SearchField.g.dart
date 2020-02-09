// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchField.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchField on _SearchField, Store {
  final _$searchValueAtom = Atom(name: '_SearchField.searchValue');

  @override
  String get searchValue {
    _$searchValueAtom.context.enforceReadPolicy(_$searchValueAtom);
    _$searchValueAtom.reportObserved();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.context.conditionallyRunInAction(() {
      super.searchValue = value;
      _$searchValueAtom.reportChanged();
    }, _$searchValueAtom, name: '${_$searchValueAtom.name}_set');
  }

  final _$_SearchFieldActionController = ActionController(name: '_SearchField');

  @override
  void handleType(String text) {
    final _$actionInfo = _$_SearchFieldActionController.startAction();
    try {
      return super.handleType(text);
    } finally {
      _$_SearchFieldActionController.endAction(_$actionInfo);
    }
  }
}
