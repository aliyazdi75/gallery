import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ceit_alumni/data/models/account/src/serializers.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  @nullable
  String get token;

  @nullable
  String get url;

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

  @nullable
  @BuiltValueField(wireName: 'last_login')
  String get lastLogin;

  @nullable
  @BuiltValueField(wireName: 'date_joined')
  String get dateJoined;

  @nullable
  AccountGenericField get locations;

  @nullable
  AccountGenericField get checkins;

  @nullable
  AccountGenericField get following;

  @nullable
  AccountGenericField get followers;

  @nullable
  AccountGenericField get tips;

  @nullable
  AccountGenericField get likes;

  @nullable
  AccountGenericField get saves;

  @nullable
  AccountGenericField get lists;

  @nullable
  Foursquare get foursquare;

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

abstract class AccountGenericField
    implements Built<AccountGenericField, AccountGenericFieldBuilder> {
  @nullable
  int get count;

  @nullable
  String get url;

  AccountGenericField._();
  factory AccountGenericField(
          [void Function(AccountGenericFieldBuilder) updates]) =
      _$AccountGenericField;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AccountGenericField.serializer, this)
        as Map<String, dynamic>;
  }

  static AccountGenericField fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AccountGenericField.serializer, json);
  }

  static Serializer<AccountGenericField> get serializer =>
      _$accountGenericFieldSerializer;
}

abstract class Foursquare implements Built<Foursquare, FoursquareBuilder> {
  @nullable
  String get url;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'date_joined')
  String get dateJoined;

  Foursquare._();

  factory Foursquare([void Function(FoursquareBuilder) updates]) = _$Foursquare;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Foursquare.serializer, this)
        as Map<String, dynamic>;
  }

  static Foursquare fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Foursquare.serializer, json);
  }

  static Serializer<Foursquare> get serializer => _$foursquareSerializer;
}
