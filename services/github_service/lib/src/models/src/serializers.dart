library serializers;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'contents.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([
  GithubContent,
  GithubContentType,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(String serialized) => serializers.fromJson<T>(
    serializers.serializerForType(T)! as Serializer<T>, serialized)!;

BuiltList<T> deserializeListOf<T>(String jsonList) => BuiltList.from(
      (json.decode(jsonList) as List<dynamic>)
          .map<T>(
            (dynamic jsonItem) => deserialize<T>(json.encode(jsonItem)),
          )
          .toList(growable: false),
    );
