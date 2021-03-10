import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  String get name;

  String get path;

  Album._();

  factory Album([void Function(AlbumBuilder) updates]) = _$Album;

  static Serializer<Album> get serializer => _$albumSerializer;
}
