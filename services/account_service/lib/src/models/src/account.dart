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

  String toJson() {
    return serializers.toJson(Account.serializer, this);
  }

  static Account fromJson(String serialized) {
    return serializers.fromJson(Account.serializer, serialized)!;
  }

  static Serializer<Account> get serializer => _$accountSerializer;
}
