// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GameState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  Map<int, Hole> get holes => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;
  bool get allPlayersJoined => throw _privateConstructorUsedError;
  int get numberOfHoles => throw _privateConstructorUsedError;
  String get roomCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {Map<int, Hole> holes,
      List<Player> players,
      bool allPlayersJoined,
      int numberOfHoles,
      String roomCode});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holes = null,
    Object? players = null,
    Object? allPlayersJoined = null,
    Object? numberOfHoles = null,
    Object? roomCode = null,
  }) {
    return _then(_value.copyWith(
      holes: null == holes
          ? _value.holes
          : holes // ignore: cast_nullable_to_non_nullable
              as Map<int, Hole>,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      allPlayersJoined: null == allPlayersJoined
          ? _value.allPlayersJoined
          : allPlayersJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfHoles: null == numberOfHoles
          ? _value.numberOfHoles
          : numberOfHoles // ignore: cast_nullable_to_non_nullable
              as int,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<int, Hole> holes,
      List<Player> players,
      bool allPlayersJoined,
      int numberOfHoles,
      String roomCode});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holes = null,
    Object? players = null,
    Object? allPlayersJoined = null,
    Object? numberOfHoles = null,
    Object? roomCode = null,
  }) {
    return _then(_$GameStateImpl(
      holes: null == holes
          ? _value._holes
          : holes // ignore: cast_nullable_to_non_nullable
              as Map<int, Hole>,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      allPlayersJoined: null == allPlayersJoined
          ? _value.allPlayersJoined
          : allPlayersJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfHoles: null == numberOfHoles
          ? _value.numberOfHoles
          : numberOfHoles // ignore: cast_nullable_to_non_nullable
              as int,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {final Map<int, Hole> holes = const {},
      final List<Player> players = const [],
      this.allPlayersJoined = false,
      this.numberOfHoles = 1,
      this.roomCode = ''})
      : _holes = holes,
        _players = players;

  final Map<int, Hole> _holes;
  @override
  @JsonKey()
  Map<int, Hole> get holes {
    if (_holes is EqualUnmodifiableMapView) return _holes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_holes);
  }

  final List<Player> _players;
  @override
  @JsonKey()
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final bool allPlayersJoined;
  @override
  @JsonKey()
  final int numberOfHoles;
  @override
  @JsonKey()
  final String roomCode;

  @override
  String toString() {
    return 'GameState(holes: $holes, players: $players, allPlayersJoined: $allPlayersJoined, numberOfHoles: $numberOfHoles, roomCode: $roomCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            const DeepCollectionEquality().equals(other._holes, _holes) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.allPlayersJoined, allPlayersJoined) ||
                other.allPlayersJoined == allPlayersJoined) &&
            (identical(other.numberOfHoles, numberOfHoles) ||
                other.numberOfHoles == numberOfHoles) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_holes),
      const DeepCollectionEquality().hash(_players),
      allPlayersJoined,
      numberOfHoles,
      roomCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final Map<int, Hole> holes,
      final List<Player> players,
      final bool allPlayersJoined,
      final int numberOfHoles,
      final String roomCode}) = _$GameStateImpl;

  @override
  Map<int, Hole> get holes;
  @override
  List<Player> get players;
  @override
  bool get allPlayersJoined;
  @override
  int get numberOfHoles;
  @override
  String get roomCode;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
