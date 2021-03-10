import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'contents.g.dart';

class GithubContents {
  static List<GithubContent> fromJson(String serialized) {
    return deserializeListOf<GithubContent>(serialized).toList();
  }
}

abstract class GithubContent
    implements Built<GithubContent, GithubContentBuilder> {
  String get name;

  String get path;

  int get size;

  @BuiltValueField(wireName: 'download_url')
  String? get url;

  GithubContentType get type;

  GithubContent._();

  factory GithubContent([void Function(GithubContentBuilder) updates]) =
      _$GithubContent;

  static GithubContent fromJson(String serialized) {
    return serializers.fromJson(GithubContent.serializer, serialized)!;
  }

  static Serializer<GithubContent> get serializer => _$githubContentSerializer;
}

class GithubContentType extends EnumClass {
  static const GithubContentType dir = _$dir;
  static const GithubContentType file = _$file;

  const GithubContentType._(String name) : super(name);

  static BuiltSet<GithubContentType> get values => _$githubContentTypeValues;

  static GithubContentType valueOf(String name) =>
      _$githubContentTypeValueOf(name);

  static Serializer<GithubContentType> get serializer =>
      _$githubContentTypeSerializer;
}
