// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Login> _$loginSerializer = new _$LoginSerializer();
Serializer<LoginBody> _$loginBodySerializer = new _$LoginBodySerializer();

class _$LoginSerializer implements StructuredSerializer<Login> {
  @override
  final Iterable<Type> types = const [Login, _$Login];
  @override
  final String wireName = 'Login';

  @override
  Iterable<Object?> serialize(Serializers serializers, Login object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Login deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginBodySerializer implements StructuredSerializer<LoginBody> {
  @override
  final Iterable<Type> types = const [LoginBody, _$LoginBody];
  @override
  final String wireName = 'LoginBody';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginBody deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Login extends Login {
  @override
  final String? token;
  @override
  final int? id;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;

  factory _$Login([void Function(LoginBuilder)? updates]) =>
      (new LoginBuilder()..update(updates)).build();

  _$Login._(
      {this.token,
      this.id,
      required this.username,
      this.email,
      this.firstName,
      this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'Login', 'username');
  }

  @override
  Login rebuild(void Function(LoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBuilder toBuilder() => new LoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Login &&
        token == other.token &&
        id == other.id &&
        username == other.username &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, token.hashCode), id.hashCode),
                    username.hashCode),
                email.hashCode),
            firstName.hashCode),
        lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Login')
          ..add('token', token)
          ..add('id', id)
          ..add('username', username)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class LoginBuilder implements Builder<Login, LoginBuilder> {
  _$Login? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  LoginBuilder();

  LoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _id = $v.id;
      _username = $v.username;
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Login other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Login;
  }

  @override
  void update(void Function(LoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Login build() {
    final _$result = _$v ??
        new _$Login._(
            token: token,
            id: id,
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'Login', 'username'),
            email: email,
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

class _$LoginBody extends LoginBody {
  @override
  final String username;
  @override
  final String password;

  factory _$LoginBody([void Function(LoginBodyBuilder)? updates]) =>
      (new LoginBodyBuilder()..update(updates)).build();

  _$LoginBody._({required this.username, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'LoginBody', 'username');
    BuiltValueNullFieldError.checkNotNull(password, 'LoginBody', 'password');
  }

  @override
  LoginBody rebuild(void Function(LoginBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBodyBuilder toBuilder() => new LoginBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginBody &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginBody')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginBodyBuilder implements Builder<LoginBody, LoginBodyBuilder> {
  _$LoginBody? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginBodyBuilder();

  LoginBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginBody;
  }

  @override
  void update(void Function(LoginBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginBody build() {
    final _$result = _$v ??
        new _$LoginBody._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'LoginBody', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'LoginBody', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
