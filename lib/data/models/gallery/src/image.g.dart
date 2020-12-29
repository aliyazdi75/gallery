// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Image> _$imageSerializer = new _$ImageSerializer();

class _$ImageSerializer implements StructuredSerializer<Image> {
  @override
  final Iterable<Type> types = const [Image, _$Image];
  @override
  final String wireName = 'Image';

  @override
  Iterable<Object> serialize(Serializers serializers, Image object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Image deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageBuilder();

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
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
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

class _$Image extends Image {
  @override
  final String name;
  @override
  final String thumbnail;
  @override
  final int height;
  @override
  final int width;

  factory _$Image([void Function(ImageBuilder) updates]) =>
      (new ImageBuilder()..update(updates)).build();

  _$Image._({this.name, this.thumbnail, this.height, this.width}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Image', 'name');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Image', 'thumbnail');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('Image', 'height');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('Image', 'width');
    }
  }

  @override
  Image rebuild(void Function(ImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageBuilder toBuilder() => new ImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Image &&
        name == other.name &&
        thumbnail == other.thumbnail &&
        height == other.height &&
        width == other.width;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), thumbnail.hashCode), height.hashCode),
        width.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Image')
          ..add('name', name)
          ..add('thumbnail', thumbnail)
          ..add('height', height)
          ..add('width', width))
        .toString();
  }
}

class ImageBuilder implements Builder<Image, ImageBuilder> {
  _$Image _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  ImageBuilder();

  ImageBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _thumbnail = _$v.thumbnail;
      _height = _$v.height;
      _width = _$v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Image other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Image;
  }

  @override
  void update(void Function(ImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Image build() {
    final _$result = _$v ??
        new _$Image._(
            name: name, thumbnail: thumbnail, height: height, width: width);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
