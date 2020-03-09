// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListingsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListingsStore on _ListingsStore, Store {
  final _$listAtom = Atom(name: '_ListingsStore.list');

  @override
  ObservableList<ListingModel> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<ListingModel> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$fetchByPageAsyncAction = AsyncAction('fetchByPage');

  @override
  Future<dynamic> fetchByPage(int page) {
    return _$fetchByPageAsyncAction.run(() => super.fetchByPage(page));
  }

  final _$_ListingsStoreActionController =
      ActionController(name: '_ListingsStore');

  @override
  Map<String, dynamic> fetchListings(Map<String, dynamic> listings) {
    final _$actionInfo = _$_ListingsStoreActionController.startAction();
    try {
      return super.fetchListings(listings);
    } finally {
      _$_ListingsStoreActionController.endAction(_$actionInfo);
    }
  }
}
