// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentStore on _StudentStore, Store {
  late final _$idAtom = Atom(name: '_StudentStore.id', context: context);

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

  late final _$nameAtom = Atom(name: '_StudentStore.name', context: context);

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

  late final _$emailAtom = Atom(name: '_StudentStore.email', context: context);

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
      Atom(name: '_StudentStore.contact', context: context);

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

  late final _$dateBirthAtom =
      Atom(name: '_StudentStore.dateBirth', context: context);

  @override
  DateTime? get dateBirth {
    _$dateBirthAtom.reportRead();
    return super.dateBirth;
  }

  @override
  set dateBirth(DateTime? value) {
    _$dateBirthAtom.reportWrite(value, super.dateBirth, () {
      super.dateBirth = value;
    });
  }

  late final _$idResponsibleAtom =
      Atom(name: '_StudentStore.idResponsible', context: context);

  @override
  String? get idResponsible {
    _$idResponsibleAtom.reportRead();
    return super.idResponsible;
  }

  @override
  set idResponsible(String? value) {
    _$idResponsibleAtom.reportWrite(value, super.idResponsible, () {
      super.idResponsible = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_StudentStore.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$_StudentStoreActionController =
      ActionController(name: '_StudentStore', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setId');
    try {
      return super.setId(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setContact');
    try {
      return super.setContact(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateBirth(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setDateBirth');
    try {
      return super.setDateBirth(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdResponsible(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setIdResponsible');
    try {
      return super.setIdResponsible(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
contact: ${contact},
dateBirth: ${dateBirth},
idResponsible: ${idResponsible},
address: ${address}
    ''';
  }
}
