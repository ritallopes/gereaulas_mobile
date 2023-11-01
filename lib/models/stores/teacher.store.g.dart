// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeacherStore on _TeacherStore, Store {
  late final _$idAtom = Atom(name: '_TeacherStore.id', context: context);

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

  late final _$nameAtom = Atom(name: '_TeacherStore.name', context: context);

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

  late final _$emailAtom = Atom(name: '_TeacherStore.email', context: context);

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

  late final _$image_profileAtom =
      Atom(name: '_TeacherStore.image_profile', context: context);

  @override
  String get image_profile {
    _$image_profileAtom.reportRead();
    return super.image_profile;
  }

  @override
  set image_profile(String value) {
    _$image_profileAtom.reportWrite(value, super.image_profile, () {
      super.image_profile = value;
    });
  }

  late final _$_TeacherStoreActionController =
      ActionController(name: '_TeacherStore', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_TeacherStoreActionController.startAction(
        name: '_TeacherStore.setId');
    try {
      return super.setId(value);
    } finally {
      _$_TeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_TeacherStoreActionController.startAction(
        name: '_TeacherStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_TeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_TeacherStoreActionController.startAction(
        name: '_TeacherStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_TeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageProfile(String value) {
    final _$actionInfo = _$_TeacherStoreActionController.startAction(
        name: '_TeacherStore.setImageProfile');
    try {
      return super.setImageProfile(value);
    } finally {
      _$_TeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void copy(TeacherStore other) {
    final _$actionInfo =
        _$_TeacherStoreActionController.startAction(name: '_TeacherStore.copy');
    try {
      return super.copy(other);
    } finally {
      _$_TeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
image_profile: ${image_profile}
    ''';
  }
}
