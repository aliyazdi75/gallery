// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

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

Serializer<MediaType> _$mediaTypeSerializer = new _$MediaTypeSerializer();

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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
