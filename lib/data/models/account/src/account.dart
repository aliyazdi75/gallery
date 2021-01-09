import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ceit_alumni/data/models/account/src/serializers.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  @nullable
  String get token;

  int get id;

  String get username;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get email;

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
