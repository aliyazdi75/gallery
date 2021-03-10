import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gallery_service/gallery_service.dart';

import 'serializers.dart';

part 'state.g.dart';

abstract class BrowserState
    implements Built<BrowserState, BrowserStateBuilder> {
  BuiltList<String> get galleriesHistory;

  Gallery? get gallery;

  Media? get media;

  BrowserState._();

  factory BrowserState([void Function(BrowserStateBuilder) updates]) =
      _$BrowserState;

  String toJson() {
    return serializers.toJson(BrowserState.serializer, this);
  }

  static BrowserState fromJson(String serialized) {
    return serializers.fromJson(BrowserState.serializer, serialized)!;
  }

  static Serializer<BrowserState> get serializer => _$browserStateSerializer;
}
