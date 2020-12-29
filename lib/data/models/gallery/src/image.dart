import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'image.g.dart';

abstract class Image implements Built<Image, ImageBuilder> {
  String get name;

  String get thumbnail;

  int get height;

  int get width;

  Image._();

  factory Image([void Function(ImageBuilder) updates]) = _$Image;

  static Image fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Image.serializer, json);
  }

  static Serializer<Image> get serializer => _$imageSerializer;
}
