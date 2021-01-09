// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Gallery> _$gallerySerializer = new _$GallerySerializer();
Serializer<GalleryQuery> _$galleryQuerySerializer =
    new _$GalleryQuerySerializer();

class _$GallerySerializer implements StructuredSerializer<Gallery> {
  @override
  final Iterable<Type> types = const [Gallery, _$Gallery];
  @override
  final String wireName = 'Gallery';

  @override
  Iterable<Object> serialize(Serializers serializers, Gallery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'albums',
      serializers.serialize(object.albums,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Album)])),
      'images',
      serializers.serialize(object.medias,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Media)])),
    ];

    return result;
  }

  @override
  Gallery deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Album)]))
              as BuiltList<Object>);
          break;
        case 'images':
          result.medias.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Media)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryQuerySerializer implements StructuredSerializer<GalleryQuery> {
  @override
  final Iterable<Type> types = const [GalleryQuery, _$GalleryQuery];
  @override
  final String wireName = 'GalleryQuery';

  @override
  Iterable<Object> serialize(Serializers serializers, GalleryQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.path != null) {
      result
        ..add('path')
        ..add(serializers.serialize(object.path,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GalleryQuery deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Gallery extends Gallery {
  @override
  final String path;
  @override
  final BuiltList<Album> albums;
  @override
  final BuiltList<Media> medias;

  factory _$Gallery([void Function(GalleryBuilder) updates]) =>
      (new GalleryBuilder()..update(updates)).build();

  _$Gallery._({this.path, this.albums, this.medias}) : super._() {
    if (path == null) {
      throw new BuiltValueNullFieldError('Gallery', 'path');
    }
    if (albums == null) {
      throw new BuiltValueNullFieldError('Gallery', 'albums');
    }
    if (medias == null) {
      throw new BuiltValueNullFieldError('Gallery', 'medias');
    }
  }

  @override
  Gallery rebuild(void Function(GalleryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryBuilder toBuilder() => new GalleryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gallery &&
        path == other.path &&
        albums == other.albums &&
        medias == other.medias;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, path.hashCode), albums.hashCode), medias.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Gallery')
          ..add('path', path)
          ..add('albums', albums)
          ..add('medias', medias))
        .toString();
  }
}

class GalleryBuilder implements Builder<Gallery, GalleryBuilder> {
  _$Gallery _$v;

  String _path;
  String get path => _$this._path;
  set path(String path) => _$this._path = path;

  ListBuilder<Album> _albums;
  ListBuilder<Album> get albums => _$this._albums ??= new ListBuilder<Album>();
  set albums(ListBuilder<Album> albums) => _$this._albums = albums;

  ListBuilder<Media> _medias;
  ListBuilder<Media> get medias => _$this._medias ??= new ListBuilder<Media>();
  set medias(ListBuilder<Media> medias) => _$this._medias = medias;

  GalleryBuilder();

  GalleryBuilder get _$this {
    if (_$v != null) {
      _path = _$v.path;
      _albums = _$v.albums?.toBuilder();
      _medias = _$v.medias?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Gallery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Gallery;
  }

  @override
  void update(void Function(GalleryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Gallery build() {
    _$Gallery _$result;
    try {
      _$result = _$v ??
          new _$Gallery._(
              path: path, albums: albums.build(), medias: medias.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'albums';
        albums.build();
        _$failedField = 'medias';
        medias.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Gallery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GalleryQuery extends GalleryQuery {
  @override
  final String path;

  factory _$GalleryQuery([void Function(GalleryQueryBuilder) updates]) =>
      (new GalleryQueryBuilder()..update(updates)).build();

  _$GalleryQuery._({this.path}) : super._();

  @override
  GalleryQuery rebuild(void Function(GalleryQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryQueryBuilder toBuilder() => new GalleryQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryQuery && path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryQuery')..add('path', path))
        .toString();
  }
}

class GalleryQueryBuilder
    implements Builder<GalleryQuery, GalleryQueryBuilder> {
  _$GalleryQuery _$v;

  String _path;
  String get path => _$this._path;
  set path(String path) => _$this._path = path;

  GalleryQueryBuilder();

  GalleryQueryBuilder get _$this {
    if (_$v != null) {
      _path = _$v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryQuery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryQuery;
  }

  @override
  void update(void Function(GalleryQueryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryQuery build() {
    final _$result = _$v ?? new _$GalleryQuery._(path: path);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
