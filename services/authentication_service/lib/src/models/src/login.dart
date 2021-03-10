import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'login.g.dart';

abstract class Login implements Built<Login, LoginBuilder> {
  String? get token;

  int? get id;

  String get username;

  String? get email;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  Login._();

  factory Login([void Function(LoginBuilder) updates]) = _$Login;

  static Login fromJson(String serialized) {
    return serializers.fromJson(Login.serializer, serialized)!;
  }

  static Serializer<Login> get serializer => _$loginSerializer;
}

abstract class LoginBody implements Built<LoginBody, LoginBodyBuilder> {
  String get username;

  String get password;

  LoginBody._();

  factory LoginBody([void Function(LoginBodyBuilder) updates]) = _$LoginBody;

  String toJson() {
    return serializers.toJson(LoginBody.serializer, this);
  }

  static Serializer<LoginBody> get serializer => _$loginBodySerializer;
}
