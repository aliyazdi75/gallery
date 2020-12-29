// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Account> _$accountSerializer = new _$AccountSerializer();
Serializer<AccountGenericField> _$accountGenericFieldSerializer =
    new _$AccountGenericFieldSerializer();
Serializer<Foursquare> _$foursquareSerializer = new _$FoursquareSerializer();

class _$AccountSerializer implements StructuredSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];
  @override
  final String wireName = 'Account';

  @override
  Iterable<Object> serialize(Serializers serializers, Account object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
    ];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.firstName != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.lastLogin != null) {
      result
        ..add('last_login')
        ..add(serializers.serialize(object.lastLogin,
            specifiedType: const FullType(String)));
    }
    if (object.dateJoined != null) {
      result
        ..add('date_joined')
        ..add(serializers.serialize(object.dateJoined,
            specifiedType: const FullType(String)));
    }
    if (object.locations != null) {
      result
        ..add('locations')
        ..add(serializers.serialize(object.locations,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.checkins != null) {
      result
        ..add('checkins')
        ..add(serializers.serialize(object.checkins,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.following != null) {
      result
        ..add('following')
        ..add(serializers.serialize(object.following,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.followers != null) {
      result
        ..add('followers')
        ..add(serializers.serialize(object.followers,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.tips != null) {
      result
        ..add('tips')
        ..add(serializers.serialize(object.tips,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.likes != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(object.likes,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.saves != null) {
      result
        ..add('saves')
        ..add(serializers.serialize(object.saves,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.lists != null) {
      result
        ..add('lists')
        ..add(serializers.serialize(object.lists,
            specifiedType: const FullType(AccountGenericField)));
    }
    if (object.foursquare != null) {
      result
        ..add('foursquare')
        ..add(serializers.serialize(object.foursquare,
            specifiedType: const FullType(Foursquare)));
    }
    return result;
  }

  @override
  Account deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_login':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_joined':
          result.dateJoined = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locations':
          result.locations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'checkins':
          result.checkins.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'tips':
          result.tips.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'saves':
          result.saves.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'lists':
          result.lists.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountGenericField))
              as AccountGenericField);
          break;
        case 'foursquare':
          result.foursquare.replace(serializers.deserialize(value,
              specifiedType: const FullType(Foursquare)) as Foursquare);
          break;
      }
    }

    return result.build();
  }
}

class _$AccountGenericFieldSerializer
    implements StructuredSerializer<AccountGenericField> {
  @override
  final Iterable<Type> types = const [
    AccountGenericField,
    _$AccountGenericField
  ];
  @override
  final String wireName = 'AccountGenericField';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AccountGenericField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.count != null) {
      result
        ..add('count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(int)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AccountGenericField deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountGenericFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FoursquareSerializer implements StructuredSerializer<Foursquare> {
  @override
  final Iterable<Type> types = const [Foursquare, _$Foursquare];
  @override
  final String wireName = 'Foursquare';

  @override
  Iterable<Object> serialize(Serializers serializers, Foursquare object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.dateJoined != null) {
      result
        ..add('date_joined')
        ..add(serializers.serialize(object.dateJoined,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Foursquare deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoursquareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date_joined':
          result.dateJoined = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Account extends Account {
  @override
  final String token;
  @override
  final String url;
  @override
  final int id;
  @override
  final String username;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String lastLogin;
  @override
  final String dateJoined;
  @override
  final AccountGenericField locations;
  @override
  final AccountGenericField checkins;
  @override
  final AccountGenericField following;
  @override
  final AccountGenericField followers;
  @override
  final AccountGenericField tips;
  @override
  final AccountGenericField likes;
  @override
  final AccountGenericField saves;
  @override
  final AccountGenericField lists;
  @override
  final Foursquare foursquare;

  factory _$Account([void Function(AccountBuilder) updates]) =>
      (new AccountBuilder()..update(updates)).build();

  _$Account._(
      {this.token,
      this.url,
      this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.lastLogin,
      this.dateJoined,
      this.locations,
      this.checkins,
      this.following,
      this.followers,
      this.tips,
      this.likes,
      this.saves,
      this.lists,
      this.foursquare})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Account', 'id');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('Account', 'username');
    }
  }

  @override
  Account rebuild(void Function(AccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => new AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        token == other.token &&
        url == other.url &&
        id == other.id &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        lastLogin == other.lastLogin &&
        dateJoined == other.dateJoined &&
        locations == other.locations &&
        checkins == other.checkins &&
        following == other.following &&
        followers == other.followers &&
        tips == other.tips &&
        likes == other.likes &&
        saves == other.saves &&
        lists == other.lists &&
        foursquare == other.foursquare;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(0,
                                                                            token.hashCode),
                                                                        url.hashCode),
                                                                    id.hashCode),
                                                                username.hashCode),
                                                            firstName.hashCode),
                                                        lastName.hashCode),
                                                    email.hashCode),
                                                lastLogin.hashCode),
                                            dateJoined.hashCode),
                                        locations.hashCode),
                                    checkins.hashCode),
                                following.hashCode),
                            followers.hashCode),
                        tips.hashCode),
                    likes.hashCode),
                saves.hashCode),
            lists.hashCode),
        foursquare.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Account')
          ..add('token', token)
          ..add('url', url)
          ..add('id', id)
          ..add('username', username)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('lastLogin', lastLogin)
          ..add('dateJoined', dateJoined)
          ..add('locations', locations)
          ..add('checkins', checkins)
          ..add('following', following)
          ..add('followers', followers)
          ..add('tips', tips)
          ..add('likes', likes)
          ..add('saves', saves)
          ..add('lists', lists)
          ..add('foursquare', foursquare))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _lastLogin;
  String get lastLogin => _$this._lastLogin;
  set lastLogin(String lastLogin) => _$this._lastLogin = lastLogin;

  String _dateJoined;
  String get dateJoined => _$this._dateJoined;
  set dateJoined(String dateJoined) => _$this._dateJoined = dateJoined;

  AccountGenericFieldBuilder _locations;
  AccountGenericFieldBuilder get locations =>
      _$this._locations ??= new AccountGenericFieldBuilder();
  set locations(AccountGenericFieldBuilder locations) =>
      _$this._locations = locations;

  AccountGenericFieldBuilder _checkins;
  AccountGenericFieldBuilder get checkins =>
      _$this._checkins ??= new AccountGenericFieldBuilder();
  set checkins(AccountGenericFieldBuilder checkins) =>
      _$this._checkins = checkins;

  AccountGenericFieldBuilder _following;
  AccountGenericFieldBuilder get following =>
      _$this._following ??= new AccountGenericFieldBuilder();
  set following(AccountGenericFieldBuilder following) =>
      _$this._following = following;

  AccountGenericFieldBuilder _followers;
  AccountGenericFieldBuilder get followers =>
      _$this._followers ??= new AccountGenericFieldBuilder();
  set followers(AccountGenericFieldBuilder followers) =>
      _$this._followers = followers;

  AccountGenericFieldBuilder _tips;
  AccountGenericFieldBuilder get tips =>
      _$this._tips ??= new AccountGenericFieldBuilder();
  set tips(AccountGenericFieldBuilder tips) => _$this._tips = tips;

  AccountGenericFieldBuilder _likes;
  AccountGenericFieldBuilder get likes =>
      _$this._likes ??= new AccountGenericFieldBuilder();
  set likes(AccountGenericFieldBuilder likes) => _$this._likes = likes;

  AccountGenericFieldBuilder _saves;
  AccountGenericFieldBuilder get saves =>
      _$this._saves ??= new AccountGenericFieldBuilder();
  set saves(AccountGenericFieldBuilder saves) => _$this._saves = saves;

  AccountGenericFieldBuilder _lists;
  AccountGenericFieldBuilder get lists =>
      _$this._lists ??= new AccountGenericFieldBuilder();
  set lists(AccountGenericFieldBuilder lists) => _$this._lists = lists;

  FoursquareBuilder _foursquare;
  FoursquareBuilder get foursquare =>
      _$this._foursquare ??= new FoursquareBuilder();
  set foursquare(FoursquareBuilder foursquare) =>
      _$this._foursquare = foursquare;

  AccountBuilder();

  AccountBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _url = _$v.url;
      _id = _$v.id;
      _username = _$v.username;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _email = _$v.email;
      _lastLogin = _$v.lastLogin;
      _dateJoined = _$v.dateJoined;
      _locations = _$v.locations?.toBuilder();
      _checkins = _$v.checkins?.toBuilder();
      _following = _$v.following?.toBuilder();
      _followers = _$v.followers?.toBuilder();
      _tips = _$v.tips?.toBuilder();
      _likes = _$v.likes?.toBuilder();
      _saves = _$v.saves?.toBuilder();
      _lists = _$v.lists?.toBuilder();
      _foursquare = _$v.foursquare?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Account build() {
    _$Account _$result;
    try {
      _$result = _$v ??
          new _$Account._(
              token: token,
              url: url,
              id: id,
              username: username,
              firstName: firstName,
              lastName: lastName,
              email: email,
              lastLogin: lastLogin,
              dateJoined: dateJoined,
              locations: _locations?.build(),
              checkins: _checkins?.build(),
              following: _following?.build(),
              followers: _followers?.build(),
              tips: _tips?.build(),
              likes: _likes?.build(),
              saves: _saves?.build(),
              lists: _lists?.build(),
              foursquare: _foursquare?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'locations';
        _locations?.build();
        _$failedField = 'checkins';
        _checkins?.build();
        _$failedField = 'following';
        _following?.build();
        _$failedField = 'followers';
        _followers?.build();
        _$failedField = 'tips';
        _tips?.build();
        _$failedField = 'likes';
        _likes?.build();
        _$failedField = 'saves';
        _saves?.build();
        _$failedField = 'lists';
        _lists?.build();
        _$failedField = 'foursquare';
        _foursquare?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Account', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AccountGenericField extends AccountGenericField {
  @override
  final int count;
  @override
  final String url;

  factory _$AccountGenericField(
          [void Function(AccountGenericFieldBuilder) updates]) =>
      (new AccountGenericFieldBuilder()..update(updates)).build();

  _$AccountGenericField._({this.count, this.url}) : super._();

  @override
  AccountGenericField rebuild(
          void Function(AccountGenericFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountGenericFieldBuilder toBuilder() =>
      new AccountGenericFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountGenericField &&
        count == other.count &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, count.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountGenericField')
          ..add('count', count)
          ..add('url', url))
        .toString();
  }
}

class AccountGenericFieldBuilder
    implements Builder<AccountGenericField, AccountGenericFieldBuilder> {
  _$AccountGenericField _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  AccountGenericFieldBuilder();

  AccountGenericFieldBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountGenericField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccountGenericField;
  }

  @override
  void update(void Function(AccountGenericFieldBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountGenericField build() {
    final _$result = _$v ?? new _$AccountGenericField._(count: count, url: url);
    replace(_$result);
    return _$result;
  }
}

class _$Foursquare extends Foursquare {
  @override
  final String url;
  @override
  final int id;
  @override
  final String dateJoined;

  factory _$Foursquare([void Function(FoursquareBuilder) updates]) =>
      (new FoursquareBuilder()..update(updates)).build();

  _$Foursquare._({this.url, this.id, this.dateJoined}) : super._();

  @override
  Foursquare rebuild(void Function(FoursquareBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoursquareBuilder toBuilder() => new FoursquareBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Foursquare &&
        url == other.url &&
        id == other.id &&
        dateJoined == other.dateJoined;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, url.hashCode), id.hashCode), dateJoined.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Foursquare')
          ..add('url', url)
          ..add('id', id)
          ..add('dateJoined', dateJoined))
        .toString();
  }
}

class FoursquareBuilder implements Builder<Foursquare, FoursquareBuilder> {
  _$Foursquare _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _dateJoined;
  String get dateJoined => _$this._dateJoined;
  set dateJoined(String dateJoined) => _$this._dateJoined = dateJoined;

  FoursquareBuilder();

  FoursquareBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _id = _$v.id;
      _dateJoined = _$v.dateJoined;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Foursquare other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Foursquare;
  }

  @override
  void update(void Function(FoursquareBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Foursquare build() {
    final _$result =
        _$v ?? new _$Foursquare._(url: url, id: id, dateJoined: dateJoined);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
