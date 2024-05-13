// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlayerScore.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerScore _$PlayerScoreFromJson(Map<String, dynamic> json) {
  return _PlayerScore.fromJson(json);
}

/// @nodoc
mixin _$PlayerScore {
  String get id => throw _privateConstructorUsedError;
  Player get player => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerScoreCopyWith<PlayerScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerScoreCopyWith<$Res> {
  factory $PlayerScoreCopyWith(
          PlayerScore value, $Res Function(PlayerScore) then) =
      _$PlayerScoreCopyWithImpl<$Res, PlayerScore>;
  @useResult
  $Res call({String id, Player player, int score});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerScoreCopyWithImpl<$Res, $Val extends PlayerScore>
    implements $PlayerScoreCopyWith<$Res> {
  _$PlayerScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player {
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerScoreImplCopyWith<$Res>
    implements $PlayerScoreCopyWith<$Res> {
  factory _$$PlayerScoreImplCopyWith(
          _$PlayerScoreImpl value, $Res Function(_$PlayerScoreImpl) then) =
      __$$PlayerScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Player player, int score});

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerScoreImplCopyWithImpl<$Res>
    extends _$PlayerScoreCopyWithImpl<$Res, _$PlayerScoreImpl>
    implements _$$PlayerScoreImplCopyWith<$Res> {
  __$$PlayerScoreImplCopyWithImpl(
      _$PlayerScoreImpl _value, $Res Function(_$PlayerScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? score = null,
  }) {
    return _then(_$PlayerScoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerScoreImpl implements _PlayerScore {
  const _$PlayerScoreImpl(
      {required this.id, required this.player, required this.score});

  factory _$PlayerScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerScoreImplFromJson(json);

  @override
  final String id;
  @override
  final Player player;
  @override
  final int score;

  @override
  String toString() {
    return 'PlayerScore(id: $id, player: $player, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, player, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerScoreImplCopyWith<_$PlayerScoreImpl> get copyWith =>
      __$$PlayerScoreImplCopyWithImpl<_$PlayerScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerScoreImplToJson(
      this,
    );
  }
}

abstract class _PlayerScore implements PlayerScore {
  const factory _PlayerScore(
      {required final String id,
      required final Player player,
      required final int score}) = _$PlayerScoreImpl;

  factory _PlayerScore.fromJson(Map<String, dynamic> json) =
      _$PlayerScoreImpl.fromJson;

  @override
  String get id;
  @override
  Player get player;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$PlayerScoreImplCopyWith<_$PlayerScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
