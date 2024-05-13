// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Hole.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hole _$HoleFromJson(Map<String, dynamic> json) {
  return _Hole.fromJson(json);
}

/// @nodoc
mixin _$Hole {
  String get id => throw _privateConstructorUsedError;
  List<PlayerScore> get playerScores => throw _privateConstructorUsedError;
  int get holeNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoleCopyWith<Hole> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoleCopyWith<$Res> {
  factory $HoleCopyWith(Hole value, $Res Function(Hole) then) =
      _$HoleCopyWithImpl<$Res, Hole>;
  @useResult
  $Res call({String id, List<PlayerScore> playerScores, int holeNumber});
}

/// @nodoc
class _$HoleCopyWithImpl<$Res, $Val extends Hole>
    implements $HoleCopyWith<$Res> {
  _$HoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerScores = null,
    Object? holeNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerScores: null == playerScores
          ? _value.playerScores
          : playerScores // ignore: cast_nullable_to_non_nullable
              as List<PlayerScore>,
      holeNumber: null == holeNumber
          ? _value.holeNumber
          : holeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HoleImplCopyWith<$Res> implements $HoleCopyWith<$Res> {
  factory _$$HoleImplCopyWith(
          _$HoleImpl value, $Res Function(_$HoleImpl) then) =
      __$$HoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<PlayerScore> playerScores, int holeNumber});
}

/// @nodoc
class __$$HoleImplCopyWithImpl<$Res>
    extends _$HoleCopyWithImpl<$Res, _$HoleImpl>
    implements _$$HoleImplCopyWith<$Res> {
  __$$HoleImplCopyWithImpl(_$HoleImpl _value, $Res Function(_$HoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerScores = null,
    Object? holeNumber = null,
  }) {
    return _then(_$HoleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerScores: null == playerScores
          ? _value._playerScores
          : playerScores // ignore: cast_nullable_to_non_nullable
              as List<PlayerScore>,
      holeNumber: null == holeNumber
          ? _value.holeNumber
          : holeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HoleImpl extends _Hole {
  const _$HoleImpl(
      {required this.id,
      required final List<PlayerScore> playerScores,
      required this.holeNumber})
      : _playerScores = playerScores,
        super._();

  factory _$HoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoleImplFromJson(json);

  @override
  final String id;
  final List<PlayerScore> _playerScores;
  @override
  List<PlayerScore> get playerScores {
    if (_playerScores is EqualUnmodifiableListView) return _playerScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerScores);
  }

  @override
  final int holeNumber;

  @override
  String toString() {
    return 'Hole(id: $id, playerScores: $playerScores, holeNumber: $holeNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._playerScores, _playerScores) &&
            (identical(other.holeNumber, holeNumber) ||
                other.holeNumber == holeNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_playerScores), holeNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoleImplCopyWith<_$HoleImpl> get copyWith =>
      __$$HoleImplCopyWithImpl<_$HoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HoleImplToJson(
      this,
    );
  }
}

abstract class _Hole extends Hole {
  const factory _Hole(
      {required final String id,
      required final List<PlayerScore> playerScores,
      required final int holeNumber}) = _$HoleImpl;
  const _Hole._() : super._();

  factory _Hole.fromJson(Map<String, dynamic> json) = _$HoleImpl.fromJson;

  @override
  String get id;
  @override
  List<PlayerScore> get playerScores;
  @override
  int get holeNumber;
  @override
  @JsonKey(ignore: true)
  _$$HoleImplCopyWith<_$HoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
