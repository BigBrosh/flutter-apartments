// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Listings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Listings on _Listings, Store {
  final _$listAtom = Atom(name: '_Listings.list');

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

  final _$_ListingsActionController = ActionController(name: '_Listings');

  @override
  Map<String, dynamic> fetchListings(Map<String, dynamic> listings) {
    final _$actionInfo = _$_ListingsActionController.startAction();
    try {
      return super.fetchListings(listings);
    } finally {
      _$_ListingsActionController.endAction(_$actionInfo);
    }
  }
}
