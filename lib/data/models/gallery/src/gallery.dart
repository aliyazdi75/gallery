import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';

import 'serializers.dart';

part 'gallery.g.dart';

abstract class Gallery implements Built<Gallery, GalleryBuilder> {
  String get path;

  @nullable
  BuiltList<Album> get albums;

  @nullable
  BuiltList<Image> get images;

  Gallery._();

  factory Gallery([void Function(GalleryBuilder) updates]) = _$Gallery;

  static Gallery fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Gallery.serializer, json);
  }

  static Serializer<Gallery> get serializer => _$gallerySerializer;
}

abstract class GalleryQuery
    implements Built<GalleryQuery, GalleryQueryBuilder> {
  @nullable
  String get path;

  GalleryQuery._();

  factory GalleryQuery([void Function(GalleryQueryBuilder) updates]) =
      _$GalleryQuery;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(GalleryQuery.serializer, this)
        as Map<String, dynamic>;
  }

  static GalleryQuery fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(GalleryQuery.serializer, json);
  }

  static Serializer<GalleryQuery> get serializer => _$galleryQuerySerializer;
}
