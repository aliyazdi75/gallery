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

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  Register._();

  factory Register([void Function(RegisterBuilder) updates]) = _$Register;

  String toJson() {
    return serializers.toJson(Register.serializer, this);
  }

  static Register fromJson(String serialized) {
    return serializers.fromJson(Register.serializer, serialized)!;
  }

  static Serializer<Register> get serializer => _$registerSerializer;
}
