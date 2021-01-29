import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'media.g.dart';

abstract class Media implements Built<Media, MediaBuilder> {
  String get name;

  MediaType get type;

  String get thumbnail;

  String get url;

  int get height;

  int get width;

  Media._();

  factory Media([void Function(MediaBuilder) updates]) = _$Media;

  static Media fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Media.serializer, json);
  }

  static Serializer<Media> get serializer => _$mediaSerializer;
}

class MediaType extends EnumClass {
  static const MediaType image = _$image;
  static const MediaType video = _$video;

  const MediaType._(String name) : super(name);

  static BuiltSet<MediaType> get values => _$mediaTypeValues;

  static MediaType valueOf(String name) => _$mediaTypeValueOf(name);

  static MediaType deserialize(String string) {
    return serializers.deserializeWith(MediaType.serializer, string);
  }

  static Serializer<MediaType> get serializer => _$mediaTypeSerializer;
}
