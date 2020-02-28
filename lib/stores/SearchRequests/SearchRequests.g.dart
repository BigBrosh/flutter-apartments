// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchRequests.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchRequests on _SearchRequests, Store {
  final _$listAtom = Atom(name: '_SearchRequests.list');

  @override
  List<SearchRequestM> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<SearchRequestM> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$_SearchRequestsActionController =
      ActionController(name: '_SearchRequests');

  @override
  void add(SearchRequestM request) {
    final _$actionInfo = _$_SearchRequestsActionController.startAction();
    try {
      return super.add(request);
    } finally {
      _$_SearchRequestsActionController.endAction(_$actionInfo);
    }
  }
}
