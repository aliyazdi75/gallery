import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ceit_alumni/data/models/gallery/src/serializers.dart';

part 'media_type.g.dart';

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
