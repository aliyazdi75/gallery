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
  Iterable<Object> serialize(Serializers serializers, Login object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
    ];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.firstName != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Login deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
  Iterable<Object> serialize(Serializers serializers, LoginBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  LoginBody deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
  final String token;
  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$Login([void Function(LoginBuilder) updates]) =>
      (new LoginBuilder()..update(updates)).build();

  _$Login._(
      {this.token,
      this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('Login', 'username');
    }
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
  _$Login _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  LoginBuilder();

  LoginBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _id = _$v.id;
      _username = _$v.username;
      _email = _$v.email;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Login other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Login;
  }

  @override
  void update(void Function(LoginBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Login build() {
    final _$result = _$v ??
        new _$Login._(
            token: token,
            id: id,
            username: username,
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

  factory _$LoginBody([void Function(LoginBodyBuilder) updates]) =>
      (new LoginBodyBuilder()..update(updates)).build();

  _$LoginBody._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('LoginBody', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginBody', 'password');
    }
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
  _$LoginBody _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  LoginBodyBuilder();

  LoginBodyBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginBody other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginBody;
  }

  @override
  void update(void Function(LoginBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginBody build() {
    final _$result =
        _$v ?? new _$LoginBody._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
