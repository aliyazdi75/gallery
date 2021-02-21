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

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(BrowserState.serializer, this)
        as Map<String, dynamic>;
  }

  static BrowserState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BrowserState.serializer, json);
  }

  static Serializer<BrowserState> get serializer => _$browserStateSerializer;
}
