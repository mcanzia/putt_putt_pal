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

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  Room get room => throw _privateConstructorUsedError;
  Player? get editPlayer => throw _privateConstructorUsedError;
  Player? get currentUser => throw _privateConstructorUsedError;
  bool get colorPickerMode => throw _privateConstructorUsedError;
  PlayerColor get currentColor => throw _privateConstructorUsedError;
  List<PlayerColor> get playerColors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      {Room room,
      Player? editPlayer,
      Player? currentUser,
      bool colorPickerMode,
      PlayerColor currentColor,
      List<PlayerColor> playerColors});

  $RoomCopyWith<$Res> get room;
  $PlayerCopyWith<$Res>? get editPlayer;
  $PlayerCopyWith<$Res>? get currentUser;
  $PlayerColorCopyWith<$Res> get currentColor;
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
    Object? room = null,
    Object? editPlayer = freezed,
    Object? currentUser = freezed,
    Object? colorPickerMode = null,
    Object? currentColor = null,
    Object? playerColors = null,
  }) {
    return _then(_value.copyWith(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
      editPlayer: freezed == editPlayer
          ? _value.editPlayer
          : editPlayer // ignore: cast_nullable_to_non_nullable
              as Player?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Player?,
      colorPickerMode: null == colorPickerMode
          ? _value.colorPickerMode
          : colorPickerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as PlayerColor,
      playerColors: null == playerColors
          ? _value.playerColors
          : playerColors // ignore: cast_nullable_to_non_nullable
              as List<PlayerColor>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomCopyWith<$Res> get room {
    return $RoomCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res>? get editPlayer {
    if (_value.editPlayer == null) {
      return null;
    }

    return $PlayerCopyWith<$Res>(_value.editPlayer!, (value) {
      return _then(_value.copyWith(editPlayer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $PlayerCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerColorCopyWith<$Res> get currentColor {
    return $PlayerColorCopyWith<$Res>(_value.currentColor, (value) {
      return _then(_value.copyWith(currentColor: value) as $Val);
    });
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
      {Room room,
      Player? editPlayer,
      Player? currentUser,
      bool colorPickerMode,
      PlayerColor currentColor,
      List<PlayerColor> playerColors});

  @override
  $RoomCopyWith<$Res> get room;
  @override
  $PlayerCopyWith<$Res>? get editPlayer;
  @override
  $PlayerCopyWith<$Res>? get currentUser;
  @override
  $PlayerColorCopyWith<$Res> get currentColor;
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
    Object? room = null,
    Object? editPlayer = freezed,
    Object? currentUser = freezed,
    Object? colorPickerMode = null,
    Object? currentColor = null,
    Object? playerColors = null,
  }) {
    return _then(_$GameStateImpl(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
      editPlayer: freezed == editPlayer
          ? _value.editPlayer
          : editPlayer // ignore: cast_nullable_to_non_nullable
              as Player?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Player?,
      colorPickerMode: null == colorPickerMode
          ? _value.colorPickerMode
          : colorPickerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as PlayerColor,
      playerColors: null == playerColors
          ? _value._playerColors
          : playerColors // ignore: cast_nullable_to_non_nullable
              as List<PlayerColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {this.room = const Room(),
      this.editPlayer = null,
      this.currentUser = null,
      this.colorPickerMode = false,
      this.currentColor = const PlayerColor(),
      final List<PlayerColor> playerColors = const []})
      : _playerColors = playerColors;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  @JsonKey()
  final Room room;
  @override
  @JsonKey()
  final Player? editPlayer;
  @override
  @JsonKey()
  final Player? currentUser;
  @override
  @JsonKey()
  final bool colorPickerMode;
  @override
  @JsonKey()
  final PlayerColor currentColor;
  final List<PlayerColor> _playerColors;
  @override
  @JsonKey()
  List<PlayerColor> get playerColors {
    if (_playerColors is EqualUnmodifiableListView) return _playerColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerColors);
  }

  @override
  String toString() {
    return 'GameState(room: $room, editPlayer: $editPlayer, currentUser: $currentUser, colorPickerMode: $colorPickerMode, currentColor: $currentColor, playerColors: $playerColors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.editPlayer, editPlayer) ||
                other.editPlayer == editPlayer) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.colorPickerMode, colorPickerMode) ||
                other.colorPickerMode == colorPickerMode) &&
            (identical(other.currentColor, currentColor) ||
                other.currentColor == currentColor) &&
            const DeepCollectionEquality()
                .equals(other._playerColors, _playerColors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      room,
      editPlayer,
      currentUser,
      colorPickerMode,
      currentColor,
      const DeepCollectionEquality().hash(_playerColors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final Room room,
      final Player? editPlayer,
      final Player? currentUser,
      final bool colorPickerMode,
      final PlayerColor currentColor,
      final List<PlayerColor> playerColors}) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  Room get room;
  @override
  Player? get editPlayer;
  @override
  Player? get currentUser;
  @override
  bool get colorPickerMode;
  @override
  PlayerColor get currentColor;
  @override
  List<PlayerColor> get playerColors;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
