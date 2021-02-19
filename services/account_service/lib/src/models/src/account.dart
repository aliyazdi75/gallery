import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  String? get token;

  int get id;

  String get username;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  String? get email;

  Account._();

  factory Account([void Function(AccountBuilder) updates]) = _$Account;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Account.serializer, this)
        as Map<String, dynamic>;
  }

  static Account fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Account.serializer, json);
  }

  static Serializer<Account> get serializer => _$accountSerializer;
}
