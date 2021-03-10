// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Register> _$registerSerializer = new _$RegisterSerializer();

class _$RegisterSerializer implements StructuredSerializer<Register> {
  @override
  final Iterable<Type> types = const [Register, _$Register];
  @override
  final String wireName = 'Register';

  @override
  Iterable<Object?> serialize(Serializers serializers, Register object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];
    Object? value;
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
  Register deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterBuilder();

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
        case 'password':
          result.password = serializers.deserialize(value,
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

class _$Register extends Register {
  @override
  final String token;
  @override
  final int id;
  @override
  final String username;
  @override
  final String password;
  @override
  final String email;
  @override
  final String? firstName;
  @override
  final String? lastName;

  factory _$Register([void Function(RegisterBuilder)? updates]) =>
      (new RegisterBuilder()..update(updates)).build();

  _$Register._(
      {required this.token,
      required this.id,
      required this.username,
      required this.password,
      required this.email,
      this.firstName,
      this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(token, 'Register', 'token');
    BuiltValueNullFieldError.checkNotNull(id, 'Register', 'id');
    BuiltValueNullFieldError.checkNotNull(username, 'Register', 'username');
    BuiltValueNullFieldError.checkNotNull(password, 'Register', 'password');
    BuiltValueNullFieldError.checkNotNull(email, 'Register', 'email');
  }

  @override
  Register rebuild(void Function(RegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBuilder toBuilder() => new RegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Register &&
        token == other.token &&
        id == other.id &&
        username == other.username &&
        password == other.password &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, token.hashCode), id.hashCode),
                        username.hashCode),
                    password.hashCode),
                email.hashCode),
            firstName.hashCode),
        lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Register')
          ..add('token', token)
          ..add('id', id)
          ..add('username', username)
          ..add('password', password)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class RegisterBuilder implements Builder<Register, RegisterBuilder> {
  _$Register? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  RegisterBuilder();

  RegisterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _id = $v.id;
      _username = $v.username;
      _password = $v.password;
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Register other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Register;
  }

  @override
  void update(void Function(RegisterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Register build() {
    final _$result = _$v ??
        new _$Register._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, 'Register', 'token'),
            id: BuiltValueNullFieldError.checkNotNull(id, 'Register', 'id'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'Register', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'Register', 'password'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'Register', 'email'),
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
