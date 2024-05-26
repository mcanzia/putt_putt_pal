// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get id => throw _privateConstructorUsedError;
  String get roomCode => throw _privateConstructorUsedError;
  Map<String, Player> get players => throw _privateConstructorUsedError;
  Map<String, Hole> get holes => throw _privateConstructorUsedError;
  bool get allPlayersJoined => throw _privateConstructorUsedError;
  int get numberOfHoles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String id,
      String roomCode,
      Map<String, Player> players,
      Map<String, Hole> holes,
      bool allPlayersJoined,
      int numberOfHoles});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomCode = null,
    Object? players = null,
    Object? holes = null,
    Object? allPlayersJoined = null,
    Object? numberOfHoles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Player>,
      holes: null == holes
          ? _value.holes
          : holes // ignore: cast_nullable_to_non_nullable
              as Map<String, Hole>,
      allPlayersJoined: null == allPlayersJoined
          ? _value.allPlayersJoined
          : allPlayersJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfHoles: null == numberOfHoles
          ? _value.numberOfHoles
          : numberOfHoles // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String roomCode,
      Map<String, Player> players,
      Map<String, Hole> holes,
      bool allPlayersJoined,
      int numberOfHoles});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomCode = null,
    Object? players = null,
    Object? holes = null,
    Object? allPlayersJoined = null,
    Object? numberOfHoles = null,
  }) {
    return _then(_$RoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Player>,
      holes: null == holes
          ? _value._holes
          : holes // ignore: cast_nullable_to_non_nullable
              as Map<String, Hole>,
      allPlayersJoined: null == allPlayersJoined
          ? _value.allPlayersJoined
          : allPlayersJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfHoles: null == numberOfHoles
          ? _value.numberOfHoles
          : numberOfHoles // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl extends _Room {
  const _$RoomImpl(
      {this.id = '',
      this.roomCode = '',
      final Map<String, Player> players = const {},
      final Map<String, Hole> holes = const {},
      this.allPlayersJoined = false,
      this.numberOfHoles = 1})
      : _players = players,
        _holes = holes,
        super._();

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String roomCode;
  final Map<String, Player> _players;
  @override
  @JsonKey()
  Map<String, Player> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  final Map<String, Hole> _holes;
  @override
  @JsonKey()
  Map<String, Hole> get holes {
    if (_holes is EqualUnmodifiableMapView) return _holes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_holes);
  }

  @override
  @JsonKey()
  final bool allPlayersJoined;
  @override
  @JsonKey()
  final int numberOfHoles;

  @override
  String toString() {
    return 'Room(id: $id, roomCode: $roomCode, players: $players, holes: $holes, allPlayersJoined: $allPlayersJoined, numberOfHoles: $numberOfHoles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._holes, _holes) &&
            (identical(other.allPlayersJoined, allPlayersJoined) ||
                other.allPlayersJoined == allPlayersJoined) &&
            (identical(other.numberOfHoles, numberOfHoles) ||
                other.numberOfHoles == numberOfHoles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      roomCode,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_holes),
      allPlayersJoined,
      numberOfHoles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room extends Room {
  const factory _Room(
      {final String id,
      final String roomCode,
      final Map<String, Player> players,
      final Map<String, Hole> holes,
      final bool allPlayersJoined,
      final int numberOfHoles}) = _$RoomImpl;
  const _Room._() : super._();

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String get id;
  @override
  String get roomCode;
  @override
  Map<String, Player> get players;
  @override
  Map<String, Hole> get holes;
  @override
  bool get allPlayersJoined;
  @override
  int get numberOfHoles;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
