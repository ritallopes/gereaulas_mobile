// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsible_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsibleListStore on _ResponsibleListStore, Store {
  late final _$responsiblesAtom =
      Atom(name: '_ResponsibleListStore.responsibles', context: context);

  @override
  ObservableList<ResponsibleStore> get responsibles {
    _$responsiblesAtom.reportRead();
    return super.responsibles;
  }

  @override
  set responsibles(ObservableList<ResponsibleStore> value) {
    _$responsiblesAtom.reportWrite(value, super.responsibles, () {
      super.responsibles = value;
    });
  }

  late final _$initResponsiblesAsyncAction =
      AsyncAction('_ResponsibleListStore.initResponsibles', context: context);

  @override
  Future<void> initResponsibles() {
    return _$initResponsiblesAsyncAction.run(() => super.initResponsibles());
  }

  late final _$_ResponsibleListStoreActionController =
      ActionController(name: '_ResponsibleListStore', context: context);

  @override
  void addResponsible(ResponsibleStore responsible) {
    final _$actionInfo = _$_ResponsibleListStoreActionController.startAction(
        name: '_ResponsibleListStore.addResponsible');
    try {
      return super.addResponsible(responsible);
    } finally {
      _$_ResponsibleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeResponsible(ResponsibleStore responsible) {
    final _$actionInfo = _$_ResponsibleListStoreActionController.startAction(
        name: '_ResponsibleListStore.removeResponsible');
    try {
      return super.removeResponsible(responsible);
    } finally {
      _$_ResponsibleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ResponsibleStore findById(String id) {
    final _$actionInfo = _$_ResponsibleListStoreActionController.startAction(
        name: '_ResponsibleListStore.findById');
    try {
      return super.findById(id);
    } finally {
      _$_ResponsibleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
responsibles: ${responsibles}
    ''';
  }
}
