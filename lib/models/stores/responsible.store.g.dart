// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsible.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsibleStore on _ResponsibleStore, Store {
  late final _$idAtom = Atom(name: '_ResponsibleStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_ResponsibleStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ResponsibleStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$contactAtom =
      Atom(name: '_ResponsibleStore.contact', context: context);

  @override
  String? get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String? value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$_ResponsibleStoreActionController =
      ActionController(name: '_ResponsibleStore', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_ResponsibleStoreActionController.startAction(
        name: '_ResponsibleStore.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ResponsibleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ResponsibleStoreActionController.startAction(
        name: '_ResponsibleStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ResponsibleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ResponsibleStoreActionController.startAction(
        name: '_ResponsibleStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ResponsibleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String value) {
    final _$actionInfo = _$_ResponsibleStoreActionController.startAction(
        name: '_ResponsibleStore.setContact');
    try {
      return super.setContact(value);
    } finally {
      _$_ResponsibleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void copy(ResponsibleStore other) {
    final _$actionInfo = _$_ResponsibleStoreActionController.startAction(
        name: '_ResponsibleStore.copy');
    try {
      return super.copy(other);
    } finally {
      _$_ResponsibleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
contact: ${contact}
    ''';
  }
}
