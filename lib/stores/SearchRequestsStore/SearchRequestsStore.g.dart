// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchRequestsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchRequestsStore on _SearchRequestsStore, Store {
  final _$listAtom = Atom(name: '_SearchRequestsStore.list');

  @override
  ObservableList<SearchRequestM> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<SearchRequestM> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$_SearchRequestsStoreActionController =
      ActionController(name: '_SearchRequestsStore');

  @override
  void filterListBySearchValue(String searchValue) {
    final _$actionInfo = _$_SearchRequestsStoreActionController.startAction();
    try {
      return super.filterListBySearchValue(searchValue);
    } finally {
      _$_SearchRequestsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(SearchRequestM request) {
    final _$actionInfo = _$_SearchRequestsStoreActionController.startAction();
    try {
      return super.add(request);
    } finally {
      _$_SearchRequestsStoreActionController.endAction(_$actionInfo);
    }
  }
}
