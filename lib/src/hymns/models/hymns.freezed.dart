// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hymns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HymnsList _$HymnsListFromJson(Map<String, dynamic> json) {
  return _HymnsList.fromJson(json);
}

/// @nodoc
mixin _$HymnsList {
  @JsonSerializable(explicitToJson: true)
  List<HymnTitle?> get categories => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  List<Hymn?> get hymns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HymnsListCopyWith<HymnsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HymnsListCopyWith<$Res> {
  factory $HymnsListCopyWith(HymnsList value, $Res Function(HymnsList) then) =
      _$HymnsListCopyWithImpl<$Res, HymnsList>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) List<HymnTitle?> categories,
      @JsonSerializable(explicitToJson: true) List<Hymn?> hymns});
}

/// @nodoc
class _$HymnsListCopyWithImpl<$Res, $Val extends HymnsList>
    implements $HymnsListCopyWith<$Res> {
  _$HymnsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? hymns = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HymnTitle?>,
      hymns: null == hymns
          ? _value.hymns
          : hymns // ignore: cast_nullable_to_non_nullable
              as List<Hymn?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HymnsListImplCopyWith<$Res>
    implements $HymnsListCopyWith<$Res> {
  factory _$$HymnsListImplCopyWith(
          _$HymnsListImpl value, $Res Function(_$HymnsListImpl) then) =
      __$$HymnsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) List<HymnTitle?> categories,
      @JsonSerializable(explicitToJson: true) List<Hymn?> hymns});
}

/// @nodoc
class __$$HymnsListImplCopyWithImpl<$Res>
    extends _$HymnsListCopyWithImpl<$Res, _$HymnsListImpl>
    implements _$$HymnsListImplCopyWith<$Res> {
  __$$HymnsListImplCopyWithImpl(
      _$HymnsListImpl _value, $Res Function(_$HymnsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? hymns = null,
  }) {
    return _then(_$HymnsListImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HymnTitle?>,
      null == hymns
          ? _value._hymns
          : hymns // ignore: cast_nullable_to_non_nullable
              as List<Hymn?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HymnsListImpl extends _HymnsList {
  const _$HymnsListImpl(
      @JsonSerializable(explicitToJson: true) final List<HymnTitle?> categories,
      @JsonSerializable(explicitToJson: true) final List<Hymn?> hymns)
      : _categories = categories,
        _hymns = hymns,
        super._();

  factory _$HymnsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$HymnsListImplFromJson(json);

  final List<HymnTitle?> _categories;
  @override
  @JsonSerializable(explicitToJson: true)
  List<HymnTitle?> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Hymn?> _hymns;
  @override
  @JsonSerializable(explicitToJson: true)
  List<Hymn?> get hymns {
    if (_hymns is EqualUnmodifiableListView) return _hymns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hymns);
  }

  @override
  String toString() {
    return 'HymnsList(categories: $categories, hymns: $hymns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HymnsListImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._hymns, _hymns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_hymns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HymnsListImplCopyWith<_$HymnsListImpl> get copyWith =>
      __$$HymnsListImplCopyWithImpl<_$HymnsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HymnsListImplToJson(
      this,
    );
  }
}

abstract class _HymnsList extends HymnsList {
  const factory _HymnsList(
      @JsonSerializable(explicitToJson: true) final List<HymnTitle?> categories,
      @JsonSerializable(explicitToJson: true)
      final List<Hymn?> hymns) = _$HymnsListImpl;
  const _HymnsList._() : super._();

  factory _HymnsList.fromJson(Map<String, dynamic> json) =
      _$HymnsListImpl.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  List<HymnTitle?> get categories;
  @override
  @JsonSerializable(explicitToJson: true)
  List<Hymn?> get hymns;
  @override
  @JsonKey(ignore: true)
  _$$HymnsListImplCopyWith<_$HymnsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hymn _$HymnFromJson(Map<String, dynamic> json) {
  return _Hymn.fromJson(json);
}

/// @nodoc
mixin _$Hymn {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get verses => throw _privateConstructorUsedError;
  List<String> get antiphones => throw _privateConstructorUsedError;
  List<String> get refrains => throw _privateConstructorUsedError;
  List<String> get chorus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HymnCopyWith<Hymn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HymnCopyWith<$Res> {
  factory $HymnCopyWith(Hymn value, $Res Function(Hymn) then) =
      _$HymnCopyWithImpl<$Res, Hymn>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> verses,
      List<String> antiphones,
      List<String> refrains,
      List<String> chorus});
}

/// @nodoc
class _$HymnCopyWithImpl<$Res, $Val extends Hymn>
    implements $HymnCopyWith<$Res> {
  _$HymnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? verses = null,
    Object? antiphones = null,
    Object? refrains = null,
    Object? chorus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      verses: null == verses
          ? _value.verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      antiphones: null == antiphones
          ? _value.antiphones
          : antiphones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      refrains: null == refrains
          ? _value.refrains
          : refrains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chorus: null == chorus
          ? _value.chorus
          : chorus // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HymnImplCopyWith<$Res> implements $HymnCopyWith<$Res> {
  factory _$$HymnImplCopyWith(
          _$HymnImpl value, $Res Function(_$HymnImpl) then) =
      __$$HymnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> verses,
      List<String> antiphones,
      List<String> refrains,
      List<String> chorus});
}

/// @nodoc
class __$$HymnImplCopyWithImpl<$Res>
    extends _$HymnCopyWithImpl<$Res, _$HymnImpl>
    implements _$$HymnImplCopyWith<$Res> {
  __$$HymnImplCopyWithImpl(_$HymnImpl _value, $Res Function(_$HymnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? verses = null,
    Object? antiphones = null,
    Object? refrains = null,
    Object? chorus = null,
  }) {
    return _then(_$HymnImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      verses: null == verses
          ? _value._verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      antiphones: null == antiphones
          ? _value._antiphones
          : antiphones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      refrains: null == refrains
          ? _value._refrains
          : refrains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chorus: null == chorus
          ? _value._chorus
          : chorus // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HymnImpl extends _Hymn {
  const _$HymnImpl(
      {required this.id,
      required this.title,
      required final List<String> verses,
      final List<String> antiphones = const [],
      final List<String> refrains = const [],
      final List<String> chorus = const []})
      : _verses = verses,
        _antiphones = antiphones,
        _refrains = refrains,
        _chorus = chorus,
        super._();

  factory _$HymnImpl.fromJson(Map<String, dynamic> json) =>
      _$$HymnImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _verses;
  @override
  List<String> get verses {
    if (_verses is EqualUnmodifiableListView) return _verses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verses);
  }

  final List<String> _antiphones;
  @override
  @JsonKey()
  List<String> get antiphones {
    if (_antiphones is EqualUnmodifiableListView) return _antiphones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_antiphones);
  }

  final List<String> _refrains;
  @override
  @JsonKey()
  List<String> get refrains {
    if (_refrains is EqualUnmodifiableListView) return _refrains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_refrains);
  }

  final List<String> _chorus;
  @override
  @JsonKey()
  List<String> get chorus {
    if (_chorus is EqualUnmodifiableListView) return _chorus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chorus);
  }

  @override
  String toString() {
    return 'Hymn(id: $id, title: $title, verses: $verses, antiphones: $antiphones, refrains: $refrains, chorus: $chorus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HymnImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._verses, _verses) &&
            const DeepCollectionEquality()
                .equals(other._antiphones, _antiphones) &&
            const DeepCollectionEquality().equals(other._refrains, _refrains) &&
            const DeepCollectionEquality().equals(other._chorus, _chorus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_verses),
      const DeepCollectionEquality().hash(_antiphones),
      const DeepCollectionEquality().hash(_refrains),
      const DeepCollectionEquality().hash(_chorus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HymnImplCopyWith<_$HymnImpl> get copyWith =>
      __$$HymnImplCopyWithImpl<_$HymnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HymnImplToJson(
      this,
    );
  }
}

abstract class _Hymn extends Hymn {
  const factory _Hymn(
      {required final String id,
      required final String title,
      required final List<String> verses,
      final List<String> antiphones,
      final List<String> refrains,
      final List<String> chorus}) = _$HymnImpl;
  const _Hymn._() : super._();

  factory _Hymn.fromJson(Map<String, dynamic> json) = _$HymnImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get verses;
  @override
  List<String> get antiphones;
  @override
  List<String> get refrains;
  @override
  List<String> get chorus;
  @override
  @JsonKey(ignore: true)
  _$$HymnImplCopyWith<_$HymnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HymnTitle _$HymnTitleFromJson(Map<String, dynamic> json) {
  return _HymnTitle.fromJson(json);
}

/// @nodoc
mixin _$HymnTitle {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<List<String>> get hymns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HymnTitleCopyWith<HymnTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HymnTitleCopyWith<$Res> {
  factory $HymnTitleCopyWith(HymnTitle value, $Res Function(HymnTitle) then) =
      _$HymnTitleCopyWithImpl<$Res, HymnTitle>;
  @useResult
  $Res call({String id, String title, List<List<String>> hymns});
}

/// @nodoc
class _$HymnTitleCopyWithImpl<$Res, $Val extends HymnTitle>
    implements $HymnTitleCopyWith<$Res> {
  _$HymnTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hymns = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hymns: null == hymns
          ? _value.hymns
          : hymns // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HymnTitleImplCopyWith<$Res>
    implements $HymnTitleCopyWith<$Res> {
  factory _$$HymnTitleImplCopyWith(
          _$HymnTitleImpl value, $Res Function(_$HymnTitleImpl) then) =
      __$$HymnTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, List<List<String>> hymns});
}

/// @nodoc
class __$$HymnTitleImplCopyWithImpl<$Res>
    extends _$HymnTitleCopyWithImpl<$Res, _$HymnTitleImpl>
    implements _$$HymnTitleImplCopyWith<$Res> {
  __$$HymnTitleImplCopyWithImpl(
      _$HymnTitleImpl _value, $Res Function(_$HymnTitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hymns = null,
  }) {
    return _then(_$HymnTitleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hymns: null == hymns
          ? _value._hymns
          : hymns // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HymnTitleImpl extends _HymnTitle {
  const _$HymnTitleImpl(
      {required this.id,
      required this.title,
      required final List<List<String>> hymns})
      : _hymns = hymns,
        super._();

  factory _$HymnTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HymnTitleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<List<String>> _hymns;
  @override
  List<List<String>> get hymns {
    if (_hymns is EqualUnmodifiableListView) return _hymns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hymns);
  }

  @override
  String toString() {
    return 'HymnTitle(id: $id, title: $title, hymns: $hymns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HymnTitleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._hymns, _hymns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_hymns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HymnTitleImplCopyWith<_$HymnTitleImpl> get copyWith =>
      __$$HymnTitleImplCopyWithImpl<_$HymnTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HymnTitleImplToJson(
      this,
    );
  }
}

abstract class _HymnTitle extends HymnTitle {
  const factory _HymnTitle(
      {required final String id,
      required final String title,
      required final List<List<String>> hymns}) = _$HymnTitleImpl;
  const _HymnTitle._() : super._();

  factory _HymnTitle.fromJson(Map<String, dynamic> json) =
      _$HymnTitleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<List<String>> get hymns;
  @override
  @JsonKey(ignore: true)
  _$$HymnTitleImplCopyWith<_$HymnTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
