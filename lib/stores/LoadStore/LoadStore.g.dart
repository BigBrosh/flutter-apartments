// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoadStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadStore on _LoadStore, Store {
  final _$isLoadingAtom = Atom(name: '_LoadStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$_LoadStoreActionController = ActionController(name: '_LoadStore');

  @override
  void loadingOn() {
    final _$actionInfo = _$_LoadStoreActionController.startAction();
    try {
      return super.loadingOn();
    } finally {
      _$_LoadStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadingOff() {
    final _$actionInfo = _$_LoadStoreActionController.startAction();
    try {
      return super.loadingOff();
    } finally {
      _$_LoadStoreActionController.endAction(_$actionInfo);
    }
  }
}
