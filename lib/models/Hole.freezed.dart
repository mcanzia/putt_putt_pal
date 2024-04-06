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

/// @nodoc
mixin _$Hole {
  Map<int, PlayerScore> get playerScores => throw _privateConstructorUsedError;
  int get holeNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HoleCopyWith<Hole> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoleCopyWith<$Res> {
  factory $HoleCopyWith(Hole value, $Res Function(Hole) then) =
      _$HoleCopyWithImpl<$Res, Hole>;
  @useResult
  $Res call({Map<int, PlayerScore> playerScores, int holeNumber});
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
    Object? playerScores = null,
    Object? holeNumber = null,
  }) {
    return _then(_value.copyWith(
      playerScores: null == playerScores
          ? _value.playerScores
          : playerScores // ignore: cast_nullable_to_non_nullable
              as Map<int, PlayerScore>,
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
  $Res call({Map<int, PlayerScore> playerScores, int holeNumber});
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
    Object? playerScores = null,
    Object? holeNumber = null,
  }) {
    return _then(_$HoleImpl(
      playerScores: null == playerScores
          ? _value._playerScores
          : playerScores // ignore: cast_nullable_to_non_nullable
              as Map<int, PlayerScore>,
      holeNumber: null == holeNumber
          ? _value.holeNumber
          : holeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HoleImpl implements _Hole {
  const _$HoleImpl(
      {required final Map<int, PlayerScore> playerScores,
      required this.holeNumber})
      : _playerScores = playerScores;

  final Map<int, PlayerScore> _playerScores;
  @override
  Map<int, PlayerScore> get playerScores {
    if (_playerScores is EqualUnmodifiableMapView) return _playerScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_playerScores);
  }

  @override
  final int holeNumber;

  @override
  String toString() {
    return 'Hole(playerScores: $playerScores, holeNumber: $holeNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoleImpl &&
            const DeepCollectionEquality()
                .equals(other._playerScores, _playerScores) &&
            (identical(other.holeNumber, holeNumber) ||
                other.holeNumber == holeNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_playerScores), holeNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoleImplCopyWith<_$HoleImpl> get copyWith =>
      __$$HoleImplCopyWithImpl<_$HoleImpl>(this, _$identity);
}

abstract class _Hole implements Hole {
  const factory _Hole(
      {required final Map<int, PlayerScore> playerScores,
      required final int holeNumber}) = _$HoleImpl;

  @override
  Map<int, PlayerScore> get playerScores;
  @override
  int get holeNumber;
  @override
  @JsonKey(ignore: true)
  _$$HoleImplCopyWith<_$HoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
