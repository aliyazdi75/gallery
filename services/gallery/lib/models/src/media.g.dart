// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Media> _$mediaSerializer = new _$MediaSerializer();

class _$MediaSerializer implements StructuredSerializer<Media> {
  @override
  final Iterable<Type> types = const [Media, _$Media];
  @override
  final String wireName = 'Media';

  @override
  Iterable<Object> serialize(Serializers serializers, Media object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MediaType)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Media deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MediaBuilder();

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
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Media extends Media {
  @override
  final String name;
  @override
  final MediaType type;
  @override
  final String thumbnail;
  @override
  final String url;
  @override
  final int height;
  @override
  final int width;

  factory _$Media([void Function(MediaBuilder) updates]) =>
      (new MediaBuilder()..update(updates)).build();

  _$Media._(
      {this.name, this.type, this.thumbnail, this.url, this.height, this.width})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Media', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Media', 'type');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Media', 'thumbnail');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Media', 'url');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('Media', 'height');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('Media', 'width');
    }
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
        type == other.type &&
        thumbnail == other.thumbnail &&
        url == other.url &&
        height == other.height &&
        width == other.width;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), type.hashCode),
                    thumbnail.hashCode),
                url.hashCode),
            height.hashCode),
        width.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Media')
          ..add('name', name)
          ..add('type', type)
          ..add('thumbnail', thumbnail)
          ..add('url', url)
          ..add('height', height)
          ..add('width', width))
        .toString();
  }
}

class MediaBuilder implements Builder<Media, MediaBuilder> {
  _$Media _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MediaType _type;
  MediaType get type => _$this._type;
  set type(MediaType type) => _$this._type = type;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  MediaBuilder();

  MediaBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _type = _$v.type;
      _thumbnail = _$v.thumbnail;
      _url = _$v.url;
      _height = _$v.height;
      _width = _$v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Media other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Media;
  }

  @override
  void update(void Function(MediaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Media build() {
    final _$result = _$v ??
        new _$Media._(
            name: name,
            type: type,
            thumbnail: thumbnail,
            url: url,
            height: height,
            width: width);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
