// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlayerRanking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerRanking _$PlayerRankingFromJson(Map<String, dynamic> json) {
  return _PlayerRanking.fromJson(json);
}

/// @nodoc
mixin _$PlayerRanking {
  String get id => throw _privateConstructorUsedError;
  Player get player => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerRankingCopyWith<PlayerRanking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerRankingCopyWith<$Res> {
  factory $PlayerRankingCopyWith(
          PlayerRanking value, $Res Function(PlayerRanking) then) =
      _$PlayerRankingCopyWithImpl<$Res, PlayerRanking>;
  @useResult
  $Res call({String id, Player player, int score});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerRankingCopyWithImpl<$Res, $Val extends PlayerRanking>
    implements $PlayerRankingCopyWith<$Res> {
  _$PlayerRankingCopyWithImpl(this._value, this._then);

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
abstract class _$$PlayerRankingImplCopyWith<$Res>
    implements $PlayerRankingCopyWith<$Res> {
  factory _$$PlayerRankingImplCopyWith(
          _$PlayerRankingImpl value, $Res Function(_$PlayerRankingImpl) then) =
      __$$PlayerRankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Player player, int score});

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerRankingImplCopyWithImpl<$Res>
    extends _$PlayerRankingCopyWithImpl<$Res, _$PlayerRankingImpl>
    implements _$$PlayerRankingImplCopyWith<$Res> {
  __$$PlayerRankingImplCopyWithImpl(
      _$PlayerRankingImpl _value, $Res Function(_$PlayerRankingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? score = null,
  }) {
    return _then(_$PlayerRankingImpl(
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
class _$PlayerRankingImpl implements _PlayerRanking {
  const _$PlayerRankingImpl(
      {required this.id, required this.player, required this.score});

  factory _$PlayerRankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerRankingImplFromJson(json);

  @override
  final String id;
  @override
  final Player player;
  @override
  final int score;

  @override
  String toString() {
    return 'PlayerRanking(id: $id, player: $player, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerRankingImpl &&
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
  _$$PlayerRankingImplCopyWith<_$PlayerRankingImpl> get copyWith =>
      __$$PlayerRankingImplCopyWithImpl<_$PlayerRankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerRankingImplToJson(
      this,
    );
  }
}

abstract class _PlayerRanking implements PlayerRanking {
  const factory _PlayerRanking(
      {required final String id,
      required final Player player,
      required final int score}) = _$PlayerRankingImpl;

  factory _PlayerRanking.fromJson(Map<String, dynamic> json) =
      _$PlayerRankingImpl.fromJson;

  @override
  String get id;
  @override
  Player get player;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$PlayerRankingImplCopyWith<_$PlayerRankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
