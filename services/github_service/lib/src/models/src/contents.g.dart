// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GithubContentType _$dir = const GithubContentType._('dir');
const GithubContentType _$file = const GithubContentType._('file');

GithubContentType _$githubContentTypeValueOf(String name) {
  switch (name) {
    case 'dir':
      return _$dir;
    case 'file':
      return _$file;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GithubContentType> _$githubContentTypeValues =
    new BuiltSet<GithubContentType>(const <GithubContentType>[
  _$dir,
  _$file,
]);

Serializer<GithubContent> _$githubContentSerializer =
    new _$GithubContentSerializer();
Serializer<GithubContentType> _$githubContentTypeSerializer =
    new _$GithubContentTypeSerializer();

class _$GithubContentSerializer implements StructuredSerializer<GithubContent> {
  @override
  final Iterable<Type> types = const [GithubContent, _$GithubContent];
  @override
  final String wireName = 'GithubContent';

  @override
  Iterable<Object?> serialize(Serializers serializers, GithubContent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(GithubContentType)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('download_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GithubContent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubContentBuilder();

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
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'download_url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(GithubContentType))
              as GithubContentType;
          break;
      }
    }

    return result.build();
  }
}

class _$GithubContentTypeSerializer
    implements PrimitiveSerializer<GithubContentType> {
  @override
  final Iterable<Type> types = const <Type>[GithubContentType];
  @override
  final String wireName = 'GithubContentType';

  @override
  Object serialize(Serializers serializers, GithubContentType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GithubContentType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GithubContentType.valueOf(serialized as String);
}

class _$GithubContent extends GithubContent {
  @override
  final String name;
  @override
  final String path;
  @override
  final int size;
  @override
  final String? url;
  @override
  final GithubContentType type;

  factory _$GithubContent([void Function(GithubContentBuilder)? updates]) =>
      (new GithubContentBuilder()..update(updates)).build();

  _$GithubContent._(
      {required this.name,
      required this.path,
      required this.size,
      this.url,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'GithubContent', 'name');
    BuiltValueNullFieldError.checkNotNull(path, 'GithubContent', 'path');
    BuiltValueNullFieldError.checkNotNull(size, 'GithubContent', 'size');
    BuiltValueNullFieldError.checkNotNull(type, 'GithubContent', 'type');
  }

  @override
  GithubContent rebuild(void Function(GithubContentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubContentBuilder toBuilder() => new GithubContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubContent &&
        name == other.name &&
        path == other.path &&
        size == other.size &&
        url == other.url &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), path.hashCode), size.hashCode),
            url.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubContent')
          ..add('name', name)
          ..add('path', path)
          ..add('size', size)
          ..add('url', url)
          ..add('type', type))
        .toString();
  }
}

class GithubContentBuilder
    implements Builder<GithubContent, GithubContentBuilder> {
  _$GithubContent? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  GithubContentType? _type;
  GithubContentType? get type => _$this._type;
  set type(GithubContentType? type) => _$this._type = type;

  GithubContentBuilder();

  GithubContentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _path = $v.path;
      _size = $v.size;
      _url = $v.url;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubContent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GithubContent;
  }

  @override
  void update(void Function(GithubContentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubContent build() {
    final _$result = _$v ??
        new _$GithubContent._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GithubContent', 'name'),
            path: BuiltValueNullFieldError.checkNotNull(
                path, 'GithubContent', 'path'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, 'GithubContent', 'size'),
            url: url,
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'GithubContent', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
