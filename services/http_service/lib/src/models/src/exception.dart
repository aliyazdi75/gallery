import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'exception.g.dart';

abstract class HttpExceptionModel
    implements Built<HttpExceptionModel, HttpExceptionModelBuilder> {
  String get key;

  String get value;

  HttpExceptionModel._();

  factory HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder) updates]) =
      _$HttpExceptionModel;

  static HttpExceptionModel fromJson(String serialized) {
    return serializers.fromJson(HttpExceptionModel.serializer, serialized)!;
  }

  static Serializer<HttpExceptionModel> get serializer =>
      _$httpExceptionModelSerializer;
}

abstract class RegisterBadRequest
    implements Built<RegisterBadRequest, RegisterBadRequestBuilder> {
  BuiltList<String>? get username;

  BuiltList<String>? get password;

  BuiltList<String>? get email;

  @BuiltValueField(wireName: 'non_field_errors')
  BuiltList<String>? get nonFieldErrors;

  RegisterBadRequest._();

  factory RegisterBadRequest(
          [void Function(RegisterBadRequestBuilder) updates]) =
      _$RegisterBadRequest;

  static RegisterBadRequest fromJson(String serialized) {
    return serializers.fromJson(RegisterBadRequest.serializer, serialized)!;
  }

  static Serializer<RegisterBadRequest> get serializer =>
      _$registerBadRequestSerializer;
}

abstract class LoginBadRequest
    implements Built<LoginBadRequest, LoginBadRequestBuilder> {
  BuiltList<String>? get username;

  BuiltList<String>? get password;

  @BuiltValueField(wireName: 'non_field_errors')
  BuiltList<String>? get nonFieldErrors;

  LoginBadRequest._();

  factory LoginBadRequest([void Function(LoginBadRequestBuilder) updates]) =
      _$LoginBadRequest;

  static LoginBadRequest fromJson(String serialized) {
    return serializers.fromJson(LoginBadRequest.serializer, serialized)!;
  }

  static Serializer<LoginBadRequest> get serializer =>
      _$loginBadRequestSerializer;
}

abstract class GalleryBadRequest
    implements Built<GalleryBadRequest, GalleryBadRequestBuilder> {
  BuiltList<String>? get path;

  @BuiltValueField(wireName: 'non_field_errors')
  BuiltList<String>? get nonFieldErrors;

  GalleryBadRequest._();

  factory GalleryBadRequest([void Function(GalleryBadRequestBuilder) updates]) =
      _$GalleryBadRequest;

  static GalleryBadRequest fromJson(String serialized) {
    return serializers.fromJson(GalleryBadRequest.serializer, serialized)!;
  }

  static Serializer<GalleryBadRequest> get serializer =>
      _$galleryBadRequestSerializer;
}
