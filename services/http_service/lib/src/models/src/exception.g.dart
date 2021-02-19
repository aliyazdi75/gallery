// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HttpExceptionModel> _$httpExceptionModelSerializer =
    new _$HttpExceptionModelSerializer();
Serializer<RegisterBadRequest> _$registerBadRequestSerializer =
    new _$RegisterBadRequestSerializer();
Serializer<LoginBadRequest> _$loginBadRequestSerializer =
    new _$LoginBadRequestSerializer();
Serializer<GalleryBadRequest> _$galleryBadRequestSerializer =
    new _$GalleryBadRequestSerializer();

class _$HttpExceptionModelSerializer
    implements StructuredSerializer<HttpExceptionModel> {
  @override
  final Iterable<Type> types = const [HttpExceptionModel, _$HttpExceptionModel];
  @override
  final String wireName = 'HttpExceptionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, HttpExceptionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HttpExceptionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HttpExceptionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterBadRequestSerializer
    implements StructuredSerializer<RegisterBadRequest> {
  @override
  final Iterable<Type> types = const [RegisterBadRequest, _$RegisterBadRequest];
  @override
  final String wireName = 'RegisterBadRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, RegisterBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nonFieldErrors;
    if (value != null) {
      result
        ..add('non_field_errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  RegisterBadRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'username':
          result.username.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'email':
          result.email.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_field_errors':
          result.nonFieldErrors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginBadRequestSerializer
    implements StructuredSerializer<LoginBadRequest> {
  @override
  final Iterable<Type> types = const [LoginBadRequest, _$LoginBadRequest];
  @override
  final String wireName = 'LoginBadRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nonFieldErrors;
    if (value != null) {
      result
        ..add('non_field_errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  LoginBadRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'username':
          result.username.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_field_errors':
          result.nonFieldErrors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryBadRequestSerializer
    implements StructuredSerializer<GalleryBadRequest> {
  @override
  final Iterable<Type> types = const [GalleryBadRequest, _$GalleryBadRequest];
  @override
  final String wireName = 'GalleryBadRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, GalleryBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object? value;
    value = object.path;
    if (value != null) {
      result
        ..add('path')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nonFieldErrors;
    if (value != null) {
      result
        ..add('non_field_errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GalleryBadRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'path':
          result.path.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_field_errors':
          result.nonFieldErrors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$HttpExceptionModel extends HttpExceptionModel {
  @override
  final String key;
  @override
  final String value;

  factory _$HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder)? updates]) =>
      (new HttpExceptionModelBuilder()..update(updates)).build();

  _$HttpExceptionModel._({required this.key, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(key, 'HttpExceptionModel', 'key');
    BuiltValueNullFieldError.checkNotNull(value, 'HttpExceptionModel', 'value');
  }

  @override
  HttpExceptionModel rebuild(
          void Function(HttpExceptionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HttpExceptionModelBuilder toBuilder() =>
      new HttpExceptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HttpExceptionModel &&
        key == other.key &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HttpExceptionModel')
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class HttpExceptionModelBuilder
    implements Builder<HttpExceptionModel, HttpExceptionModelBuilder> {
  _$HttpExceptionModel? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  HttpExceptionModelBuilder();

  HttpExceptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpExceptionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HttpExceptionModel;
  }

  @override
  void update(void Function(HttpExceptionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HttpExceptionModel build() {
    final _$result = _$v ??
        new _$HttpExceptionModel._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, 'HttpExceptionModel', 'key'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'HttpExceptionModel', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$RegisterBadRequest extends RegisterBadRequest {
  @override
  final BuiltList<String>? username;
  @override
  final BuiltList<String>? password;
  @override
  final BuiltList<String>? email;
  @override
  final BuiltList<String>? nonFieldErrors;

  factory _$RegisterBadRequest(
          [void Function(RegisterBadRequestBuilder)? updates]) =>
      (new RegisterBadRequestBuilder()..update(updates)).build();

  _$RegisterBadRequest._(
      {this.username, this.password, this.email, this.nonFieldErrors})
      : super._();

  @override
  RegisterBadRequest rebuild(
          void Function(RegisterBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBadRequestBuilder toBuilder() =>
      new RegisterBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterBadRequest &&
        username == other.username &&
        password == other.password &&
        email == other.email &&
        nonFieldErrors == other.nonFieldErrors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, username.hashCode), password.hashCode), email.hashCode),
        nonFieldErrors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterBadRequest')
          ..add('username', username)
          ..add('password', password)
          ..add('email', email)
          ..add('nonFieldErrors', nonFieldErrors))
        .toString();
  }
}

class RegisterBadRequestBuilder
    implements Builder<RegisterBadRequest, RegisterBadRequestBuilder> {
  _$RegisterBadRequest? _$v;

  ListBuilder<String>? _username;
  ListBuilder<String> get username =>
      _$this._username ??= new ListBuilder<String>();
  set username(ListBuilder<String>? username) => _$this._username = username;

  ListBuilder<String>? _password;
  ListBuilder<String> get password =>
      _$this._password ??= new ListBuilder<String>();
  set password(ListBuilder<String>? password) => _$this._password = password;

  ListBuilder<String>? _email;
  ListBuilder<String> get email => _$this._email ??= new ListBuilder<String>();
  set email(ListBuilder<String>? email) => _$this._email = email;

  ListBuilder<String>? _nonFieldErrors;
  ListBuilder<String> get nonFieldErrors =>
      _$this._nonFieldErrors ??= new ListBuilder<String>();
  set nonFieldErrors(ListBuilder<String>? nonFieldErrors) =>
      _$this._nonFieldErrors = nonFieldErrors;

  RegisterBadRequestBuilder();

  RegisterBadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username?.toBuilder();
      _password = $v.password?.toBuilder();
      _email = $v.email?.toBuilder();
      _nonFieldErrors = $v.nonFieldErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterBadRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterBadRequest;
  }

  @override
  void update(void Function(RegisterBadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterBadRequest build() {
    _$RegisterBadRequest _$result;
    try {
      _$result = _$v ??
          new _$RegisterBadRequest._(
              username: _username?.build(),
              password: _password?.build(),
              email: _email?.build(),
              nonFieldErrors: _nonFieldErrors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'username';
        _username?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'email';
        _email?.build();
        _$failedField = 'nonFieldErrors';
        _nonFieldErrors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RegisterBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoginBadRequest extends LoginBadRequest {
  @override
  final BuiltList<String>? username;
  @override
  final BuiltList<String>? password;
  @override
  final BuiltList<String>? nonFieldErrors;

  factory _$LoginBadRequest([void Function(LoginBadRequestBuilder)? updates]) =>
      (new LoginBadRequestBuilder()..update(updates)).build();

  _$LoginBadRequest._({this.username, this.password, this.nonFieldErrors})
      : super._();

  @override
  LoginBadRequest rebuild(void Function(LoginBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBadRequestBuilder toBuilder() =>
      new LoginBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginBadRequest &&
        username == other.username &&
        password == other.password &&
        nonFieldErrors == other.nonFieldErrors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, username.hashCode), password.hashCode),
        nonFieldErrors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginBadRequest')
          ..add('username', username)
          ..add('password', password)
          ..add('nonFieldErrors', nonFieldErrors))
        .toString();
  }
}

class LoginBadRequestBuilder
    implements Builder<LoginBadRequest, LoginBadRequestBuilder> {
  _$LoginBadRequest? _$v;

  ListBuilder<String>? _username;
  ListBuilder<String> get username =>
      _$this._username ??= new ListBuilder<String>();
  set username(ListBuilder<String>? username) => _$this._username = username;

  ListBuilder<String>? _password;
  ListBuilder<String> get password =>
      _$this._password ??= new ListBuilder<String>();
  set password(ListBuilder<String>? password) => _$this._password = password;

  ListBuilder<String>? _nonFieldErrors;
  ListBuilder<String> get nonFieldErrors =>
      _$this._nonFieldErrors ??= new ListBuilder<String>();
  set nonFieldErrors(ListBuilder<String>? nonFieldErrors) =>
      _$this._nonFieldErrors = nonFieldErrors;

  LoginBadRequestBuilder();

  LoginBadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username?.toBuilder();
      _password = $v.password?.toBuilder();
      _nonFieldErrors = $v.nonFieldErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginBadRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginBadRequest;
  }

  @override
  void update(void Function(LoginBadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginBadRequest build() {
    _$LoginBadRequest _$result;
    try {
      _$result = _$v ??
          new _$LoginBadRequest._(
              username: _username?.build(),
              password: _password?.build(),
              nonFieldErrors: _nonFieldErrors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'username';
        _username?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'nonFieldErrors';
        _nonFieldErrors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GalleryBadRequest extends GalleryBadRequest {
  @override
  final BuiltList<String>? path;
  @override
  final BuiltList<String>? nonFieldErrors;

  factory _$GalleryBadRequest(
          [void Function(GalleryBadRequestBuilder)? updates]) =>
      (new GalleryBadRequestBuilder()..update(updates)).build();

  _$GalleryBadRequest._({this.path, this.nonFieldErrors}) : super._();

  @override
  GalleryBadRequest rebuild(void Function(GalleryBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryBadRequestBuilder toBuilder() =>
      new GalleryBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryBadRequest &&
        path == other.path &&
        nonFieldErrors == other.nonFieldErrors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, path.hashCode), nonFieldErrors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryBadRequest')
          ..add('path', path)
          ..add('nonFieldErrors', nonFieldErrors))
        .toString();
  }
}

class GalleryBadRequestBuilder
    implements Builder<GalleryBadRequest, GalleryBadRequestBuilder> {
  _$GalleryBadRequest? _$v;

  ListBuilder<String>? _path;
  ListBuilder<String> get path => _$this._path ??= new ListBuilder<String>();
  set path(ListBuilder<String>? path) => _$this._path = path;

  ListBuilder<String>? _nonFieldErrors;
  ListBuilder<String> get nonFieldErrors =>
      _$this._nonFieldErrors ??= new ListBuilder<String>();
  set nonFieldErrors(ListBuilder<String>? nonFieldErrors) =>
      _$this._nonFieldErrors = nonFieldErrors;

  GalleryBadRequestBuilder();

  GalleryBadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path?.toBuilder();
      _nonFieldErrors = $v.nonFieldErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryBadRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GalleryBadRequest;
  }

  @override
  void update(void Function(GalleryBadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryBadRequest build() {
    _$GalleryBadRequest _$result;
    try {
      _$result = _$v ??
          new _$GalleryBadRequest._(
              path: _path?.build(), nonFieldErrors: _nonFieldErrors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'path';
        _path?.build();
        _$failedField = 'nonFieldErrors';
        _nonFieldErrors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GalleryBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
