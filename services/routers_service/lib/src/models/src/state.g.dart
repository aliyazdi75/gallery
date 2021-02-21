// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BrowserState> _$browserStateSerializer =
    new _$BrowserStateSerializer();

class _$BrowserStateSerializer implements StructuredSerializer<BrowserState> {
  @override
  final Iterable<Type> types = const [BrowserState, _$BrowserState];
  @override
  final String wireName = 'BrowserState';

  @override
  Iterable<Object> serialize(Serializers serializers, BrowserState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'galleriesHistory',
      serializers.serialize(object.galleriesHistory,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.gallery;
    if (value != null) {
      result
        ..add('gallery')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Gallery)));
    }
    value = object.media;
    if (value != null) {
      result
        ..add('media')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Media)));
    }
    return result;
  }

  @override
  BrowserState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BrowserStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'galleriesHistory':
          result.galleriesHistory.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'gallery':
          result.gallery.replace(serializers.deserialize(value,
              specifiedType: const FullType(Gallery)) as Gallery);
          break;
        case 'media':
          result.media.replace(serializers.deserialize(value,
              specifiedType: const FullType(Media)) as Media);
          break;
      }
    }

    return result.build();
  }
}

class _$BrowserState extends BrowserState {
  @override
  final BuiltList<String> galleriesHistory;
  @override
  final Gallery? gallery;
  @override
  final Media? media;

  factory _$BrowserState([void Function(BrowserStateBuilder)? updates]) =>
      (new BrowserStateBuilder()..update(updates)).build();

  _$BrowserState._({required this.galleriesHistory, this.gallery, this.media})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        galleriesHistory, 'BrowserState', 'galleriesHistory');
  }

  @override
  BrowserState rebuild(void Function(BrowserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrowserStateBuilder toBuilder() => new BrowserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrowserState &&
        galleriesHistory == other.galleriesHistory &&
        gallery == other.gallery &&
        media == other.media;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, galleriesHistory.hashCode), gallery.hashCode),
        media.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrowserState')
          ..add('galleriesHistory', galleriesHistory)
          ..add('gallery', gallery)
          ..add('media', media))
        .toString();
  }
}

class BrowserStateBuilder
    implements Builder<BrowserState, BrowserStateBuilder> {
  _$BrowserState? _$v;

  ListBuilder<String>? _galleriesHistory;
  ListBuilder<String> get galleriesHistory =>
      _$this._galleriesHistory ??= new ListBuilder<String>();
  set galleriesHistory(ListBuilder<String>? galleriesHistory) =>
      _$this._galleriesHistory = galleriesHistory;

  GalleryBuilder? _gallery;
  GalleryBuilder get gallery => _$this._gallery ??= new GalleryBuilder();
  set gallery(GalleryBuilder? gallery) => _$this._gallery = gallery;

  MediaBuilder? _media;
  MediaBuilder get media => _$this._media ??= new MediaBuilder();
  set media(MediaBuilder? media) => _$this._media = media;

  BrowserStateBuilder();

  BrowserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _galleriesHistory = $v.galleriesHistory.toBuilder();
      _gallery = $v.gallery?.toBuilder();
      _media = $v.media?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrowserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BrowserState;
  }

  @override
  void update(void Function(BrowserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrowserState build() {
    _$BrowserState _$result;
    try {
      _$result = _$v ??
          new _$BrowserState._(
              galleriesHistory: galleriesHistory.build(),
              gallery: _gallery?.build(),
              media: _media?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'galleriesHistory';
        galleriesHistory.build();
        _$failedField = 'gallery';
        _gallery?.build();
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BrowserState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
