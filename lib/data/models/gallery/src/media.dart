import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ceit_alumni/data/models/gallery/src/serializers.dart';

import 'media_type.dart';

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
