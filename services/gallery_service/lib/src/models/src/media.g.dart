// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaType _$image = const MediaType._('image');
const MediaType _$video = const MediaType._('video');

MediaType _$mediaTypeValueOf(String name) {
  switch (name) {
    case 'image':
      return _$image;
    case 'video':
      return _$video;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MediaType> _$mediaTypeValues =
    new BuiltSet<MediaType>(const <MediaType>[
  _$image,
  _$video,
]);

Serializer<Media> _$mediaSerializer = new _$MediaSerializer();
Serializer<MediaType> _$mediaTypeSerializer = new _$MediaTypeSerializer();

class _$MediaSerializer implements StructuredSerializer<Media> {
  @override
  final Iterable<Type> types = const [Media, _$Media];
  @override
  final String wireName = 'Media';

  @override
  Iterable<Object?> serialize(Serializers serializers, Media object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MediaType)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Media deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MediaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(MediaType)) as MediaType;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$MediaTypeSerializer implements PrimitiveSerializer<MediaType> {
  @override
  final Iterable<Type> types = const <Type>[MediaType];
  @override
  final String wireName = 'MediaType';

  @override
  Object serialize(Serializers serializers, MediaType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MediaType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaType.valueOf(serialized as String);
}

class _$Media extends Media {
  @override
  final String name;
  @override
  final String path;
  @override
  final MediaType type;
  @override
  final String thumbnail;
  @override
  final String url;

  factory _$Media([void Function(MediaBuilder)? updates]) =>
      (new MediaBuilder()..update(updates)).build();

  _$Media._(
      {required this.name,
      required this.path,
      required this.type,
      required this.thumbnail,
      required this.url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Media', 'name');
    BuiltValueNullFieldError.checkNotNull(path, 'Media', 'path');
    BuiltValueNullFieldError.checkNotNull(type, 'Media', 'type');
    BuiltValueNullFieldError.checkNotNull(thumbnail, 'Media', 'thumbnail');
    BuiltValueNullFieldError.checkNotNull(url, 'Media', 'url');
  }

  @override
  Media rebuild(void Function(MediaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaBuilder toBuilder() => new MediaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Media &&
        name == other.name &&
        path == other.path &&
        type == other.type &&
        thumbnail == other.thumbnail &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), path.hashCode), type.hashCode),
            thumbnail.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Media')
          ..add('name', name)
          ..add('path', path)
          ..add('type', type)
          ..add('thumbnail', thumbnail)
          ..add('url', url))
        .toString();
  }
}

class MediaBuilder implements Builder<Media, MediaBuilder> {
  _$Media? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  MediaType? _type;
  MediaType? get type => _$this._type;
  set type(MediaType? type) => _$this._type = type;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  MediaBuilder();

  MediaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _path = $v.path;
      _type = $v.type;
      _thumbnail = $v.thumbnail;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Media other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Media;
  }

  @override
  void update(void Function(MediaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Media build() {
    final _$result = _$v ??
        new _$Media._(
            name: BuiltValueNullFieldError.checkNotNull(name, 'Media', 'name'),
            path: BuiltValueNullFieldError.checkNotNull(path, 'Media', 'path'),
            type: BuiltValueNullFieldError.checkNotNull(type, 'Media', 'type'),
            thumbnail: BuiltValueNullFieldError.checkNotNull(
                thumbnail, 'Media', 'thumbnail'),
            url: BuiltValueNullFieldError.checkNotNull(url, 'Media', 'url'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
