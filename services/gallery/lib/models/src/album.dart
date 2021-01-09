import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  String get name;

  String get path;

  String get thumbnail;

  Album._();

  factory Album([void Function(AlbumBuilder) updates]) = _$Album;

  static Album fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Album.serializer, json);
  }

  static Serializer<Album> get serializer => _$albumSerializer;
}
