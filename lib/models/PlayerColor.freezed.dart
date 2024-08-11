// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlayerColor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerColor _$PlayerColorFromJson(Map<String, dynamic> json) {
  return _PlayerColor.fromJson(json);
}

/// @nodoc
mixin _$PlayerColor {
  int get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get textColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerColorCopyWith<PlayerColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerColorCopyWith<$Res> {
  factory $PlayerColorCopyWith(
          PlayerColor value, $Res Function(PlayerColor) then) =
      _$PlayerColorCopyWithImpl<$Res, PlayerColor>;
  @useResult
  $Res call({int id, String color, String textColor});
}

/// @nodoc
class _$PlayerColorCopyWithImpl<$Res, $Val extends PlayerColor>
    implements $PlayerColorCopyWith<$Res> {
  _$PlayerColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? textColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerColorImplCopyWith<$Res>
    implements $PlayerColorCopyWith<$Res> {
  factory _$$PlayerColorImplCopyWith(
          _$PlayerColorImpl value, $Res Function(_$PlayerColorImpl) then) =
      __$$PlayerColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String color, String textColor});
}

/// @nodoc
class __$$PlayerColorImplCopyWithImpl<$Res>
    extends _$PlayerColorCopyWithImpl<$Res, _$PlayerColorImpl>
    implements _$$PlayerColorImplCopyWith<$Res> {
  __$$PlayerColorImplCopyWithImpl(
      _$PlayerColorImpl _value, $Res Function(_$PlayerColorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? textColor = null,
  }) {
    return _then(_$PlayerColorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerColorImpl extends _PlayerColor {
  const _$PlayerColorImpl(
      {this.id = 0, this.color = '0xff000000', this.textColor = '0xffffffff'})
      : super._();

  factory _$PlayerColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerColorImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String textColor;

  @override
  String toString() {
    return 'PlayerColor(id: $id, color: $color, textColor: $textColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerColorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, color, textColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerColorImplCopyWith<_$PlayerColorImpl> get copyWith =>
      __$$PlayerColorImplCopyWithImpl<_$PlayerColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerColorImplToJson(
      this,
    );
  }
}

abstract class _PlayerColor extends PlayerColor {
  const factory _PlayerColor(
      {final int id,
      final String color,
      final String textColor}) = _$PlayerColorImpl;
  const _PlayerColor._() : super._();

  factory _PlayerColor.fromJson(Map<String, dynamic> json) =
      _$PlayerColorImpl.fromJson;

  @override
  int get id;
  @override
  String get color;
  @override
  String get textColor;
  @override
  @JsonKey(ignore: true)
  _$$PlayerColorImplCopyWith<_$PlayerColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
