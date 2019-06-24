// GENERATED CODE - DO NOT MODIFY BY HAND

part of list_bucket_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListBucketResult> _$listBucketResultSerializer =
    new _$ListBucketResultSerializer();

class _$ListBucketResultSerializer
    implements StructuredSerializer<ListBucketResult> {
  @override
  final Iterable<Type> types = const [ListBucketResult, _$ListBucketResult];
  @override
  final String wireName = 'ListBucketResult';

  @override
  Iterable serialize(Serializers serializers, ListBucketResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'Prefix',
      serializers.serialize(object.prefix,
          specifiedType: const FullType(String)),
      'MaxKeys',
      serializers.serialize(object.maxKeys,
          specifiedType: const FullType(String)),
      'IsTruncated',
      serializers.serialize(object.isTruncated,
          specifiedType: const FullType(String)),
      'Contents',
      serializers.serialize(object.contents,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Contents)])),
    ];

    return result;
  }

  @override
  ListBucketResult deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListBucketResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Prefix':
          result.prefix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'MaxKeys':
          result.maxKeys = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'IsTruncated':
          result.isTruncated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Contents':
          result.contents.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Contents)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ListBucketResult extends ListBucketResult {
  @override
  final String name;
  @override
  final String prefix;
  @override
  final String maxKeys;
  @override
  final String isTruncated;
  @override
  final BuiltList<Contents> contents;

  factory _$ListBucketResult(
          [void Function(ListBucketResultBuilder) updates]) =>
      (new ListBucketResultBuilder()..update(updates)).build();

  _$ListBucketResult._(
      {this.name, this.prefix, this.maxKeys, this.isTruncated, this.contents})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ListBucketResult', 'name');
    }
    if (prefix == null) {
      throw new BuiltValueNullFieldError('ListBucketResult', 'prefix');
    }
    if (maxKeys == null) {
      throw new BuiltValueNullFieldError('ListBucketResult', 'maxKeys');
    }
    if (isTruncated == null) {
      throw new BuiltValueNullFieldError('ListBucketResult', 'isTruncated');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('ListBucketResult', 'contents');
    }
  }

  @override
  ListBucketResult rebuild(void Function(ListBucketResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListBucketResultBuilder toBuilder() =>
      new ListBucketResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListBucketResult &&
        name == other.name &&
        prefix == other.prefix &&
        maxKeys == other.maxKeys &&
        isTruncated == other.isTruncated &&
        contents == other.contents;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), prefix.hashCode), maxKeys.hashCode),
            isTruncated.hashCode),
        contents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListBucketResult')
          ..add('name', name)
          ..add('prefix', prefix)
          ..add('maxKeys', maxKeys)
          ..add('isTruncated', isTruncated)
          ..add('contents', contents))
        .toString();
  }
}

class ListBucketResultBuilder
    implements Builder<ListBucketResult, ListBucketResultBuilder> {
  _$ListBucketResult _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _prefix;
  String get prefix => _$this._prefix;
  set prefix(String prefix) => _$this._prefix = prefix;

  String _maxKeys;
  String get maxKeys => _$this._maxKeys;
  set maxKeys(String maxKeys) => _$this._maxKeys = maxKeys;

  String _isTruncated;
  String get isTruncated => _$this._isTruncated;
  set isTruncated(String isTruncated) => _$this._isTruncated = isTruncated;

  ListBuilder<Contents> _contents;
  ListBuilder<Contents> get contents =>
      _$this._contents ??= new ListBuilder<Contents>();
  set contents(ListBuilder<Contents> contents) => _$this._contents = contents;

  ListBucketResultBuilder();

  ListBucketResultBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _prefix = _$v.prefix;
      _maxKeys = _$v.maxKeys;
      _isTruncated = _$v.isTruncated;
      _contents = _$v.contents?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListBucketResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListBucketResult;
  }

  @override
  void update(void Function(ListBucketResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListBucketResult build() {
    _$ListBucketResult _$result;
    try {
      _$result = _$v ??
          new _$ListBucketResult._(
              name: name,
              prefix: prefix,
              maxKeys: maxKeys,
              isTruncated: isTruncated,
              contents: contents.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'contents';
        contents.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ListBucketResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
