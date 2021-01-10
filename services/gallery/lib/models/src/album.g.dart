// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Album> _$albumSerializer = new _$AlbumSerializer();

class _$AlbumSerializer implements StructuredSerializer<Album> {
  @override
  final Iterable<Type> types = const [Album, _$Album];
  @override
  final String wireName = 'Album';

  @override
  Iterable<Object> serialize(Serializers serializers, Album object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Album deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Album extends Album {
  @override
  final String name;
  @override
  final String path;
  @override
  final String thumbnail;

  factory _$Album([void Function(AlbumBuilder) updates]) =>
      (new AlbumBuilder()..update(updates)).build();

  _$Album._({this.name, this.path, this.thumbnail}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Album', 'name');
    }
    if (path == null) {
      throw new BuiltValueNullFieldError('Album', 'path');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Album', 'thumbnail');
    }
  }

  @override
  Album rebuild(void Function(AlbumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumBuilder toBuilder() => new AlbumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Album &&
        name == other.name &&
        path == other.path &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), path.hashCode), thumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Album')
          ..add('name', name)
          ..add('path', path)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class AlbumBuilder implements Builder<Album, AlbumBuilder> {
  _$Album _$v;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _path;

  String get path => _$this._path;

  set path(String path) => _$this._path = path;

  String _thumbnail;

  String get thumbnail => _$this._thumbnail;

  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  AlbumBuilder();

  AlbumBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _path = _$v.path;
      _thumbnail = _$v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Album other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Album;
  }

  @override
  void update(void Function(AlbumBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Album build() {
    final _$result =
        _$v ?? new _$Album._(name: name, path: path, thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
