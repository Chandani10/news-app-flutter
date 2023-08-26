// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsList {
  List<News> get values => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsListCopyWith<NewsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListCopyWith<$Res> {
  factory $NewsListCopyWith(NewsList value, $Res Function(NewsList) then) =
      _$NewsListCopyWithImpl<$Res, NewsList>;
  @useResult
  $Res call({List<News> values, String countryCode});
}

/// @nodoc
class _$NewsListCopyWithImpl<$Res, $Val extends NewsList>
    implements $NewsListCopyWith<$Res> {
  _$NewsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? countryCode = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<News>,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsListCopyWith<$Res> implements $NewsListCopyWith<$Res> {
  factory _$$_NewsListCopyWith(
          _$_NewsList value, $Res Function(_$_NewsList) then) =
      __$$_NewsListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<News> values, String countryCode});
}

/// @nodoc
class __$$_NewsListCopyWithImpl<$Res>
    extends _$NewsListCopyWithImpl<$Res, _$_NewsList>
    implements _$$_NewsListCopyWith<$Res> {
  __$$_NewsListCopyWithImpl(
      _$_NewsList _value, $Res Function(_$_NewsList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? countryCode = null,
  }) {
    return _then(_$_NewsList(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<News>,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NewsList extends _NewsList {
  const _$_NewsList(
      {required final List<News> values, required this.countryCode})
      : _values = values,
        super._();

  final List<News> _values;
  @override
  List<News> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final String countryCode;

  @override
  String toString() {
    return 'NewsList(values: $values, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsList &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_values), countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsListCopyWith<_$_NewsList> get copyWith =>
      __$$_NewsListCopyWithImpl<_$_NewsList>(this, _$identity);
}

abstract class _NewsList extends NewsList {
  const factory _NewsList(
      {required final List<News> values,
      required final String countryCode}) = _$_NewsList;
  const _NewsList._() : super._();

  @override
  List<News> get values;
  @override
  String get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$_NewsListCopyWith<_$_NewsList> get copyWith =>
      throw _privateConstructorUsedError;
}
