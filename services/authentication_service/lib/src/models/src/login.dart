import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'login.g.dart';

abstract class Login implements Built<Login, LoginBuilder> {
  @nullable
  String get token;

  @nullable
  int get id;

  String get username;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  Login._();

  factory Login([void Function(LoginBuilder) updates]) = _$Login;

  static Login fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Login.serializer, json);
  }

  static Serializer<Login> get serializer => _$loginSerializer;
}

abstract class LoginBody implements Built<LoginBody, LoginBodyBuilder> {
  String get username;

  String get password;

  LoginBody._();

  factory LoginBody([void Function(LoginBodyBuilder) updates]) = _$LoginBody;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginBody.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<LoginBody> get serializer => _$loginBodySerializer;
}
