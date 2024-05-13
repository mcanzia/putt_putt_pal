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
  Room get room => throw _privateConstructorUsedError;
  Player? get editPlayer => throw _privateConstructorUsedError;
  bool get colorPickerMode => throw _privateConstructorUsedError;
  PlayerColor get currentColor => throw _privateConstructorUsedError;

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
      bool colorPickerMode,
      PlayerColor currentColor});

  $RoomCopyWith<$Res> get room;
  $PlayerCopyWith<$Res>? get editPlayer;
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
    Object? colorPickerMode = null,
    Object? currentColor = null,
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
      colorPickerMode: null == colorPickerMode
          ? _value.colorPickerMode
          : colorPickerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as PlayerColor,
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
      bool colorPickerMode,
      PlayerColor currentColor});

  @override
  $RoomCopyWith<$Res> get room;
  @override
  $PlayerCopyWith<$Res>? get editPlayer;
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
    Object? colorPickerMode = null,
    Object? currentColor = null,
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
      colorPickerMode: null == colorPickerMode
          ? _value.colorPickerMode
          : colorPickerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as PlayerColor,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {this.room = const Room(),
      this.editPlayer = null,
      this.colorPickerMode = false,
      this.currentColor = const PlayerColor()});

  @override
  @JsonKey()
  final Room room;
  @override
  @JsonKey()
  final Player? editPlayer;
  @override
  @JsonKey()
  final bool colorPickerMode;
  @override
  @JsonKey()
  final PlayerColor currentColor;

  @override
  String toString() {
    return 'GameState(room: $room, editPlayer: $editPlayer, colorPickerMode: $colorPickerMode, currentColor: $currentColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.editPlayer, editPlayer) ||
                other.editPlayer == editPlayer) &&
            (identical(other.colorPickerMode, colorPickerMode) ||
                other.colorPickerMode == colorPickerMode) &&
            (identical(other.currentColor, currentColor) ||
                other.currentColor == currentColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, room, editPlayer, colorPickerMode, currentColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final Room room,
      final Player? editPlayer,
      final bool colorPickerMode,
      final PlayerColor currentColor}) = _$GameStateImpl;

  @override
  Room get room;
  @override
  Player? get editPlayer;
  @override
  bool get colorPickerMode;
  @override
  PlayerColor get currentColor;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
