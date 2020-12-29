import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'register.g.dart';

abstract class Register implements Built<Register, RegisterBuilder> {
  String get token;

  int get id;

  String get username;

  String get password;

  String get email;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  Register._();

  factory Register([void Function(RegisterBuilder) updates]) = _$Register;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Register.serializer, this)
        as Map<String, dynamic>;
  }

  static Register fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Register.serializer, json);
  }

  static Serializer<Register> get serializer => _$registerSerializer;
}
