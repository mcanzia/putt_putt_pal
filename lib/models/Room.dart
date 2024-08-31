import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/converters/jsonConverters.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';

part 'Room.freezed.dart';
part 'Room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    @Default('') String id,
    @Default('') String roomCode,
    @Default({}) Map<String, Player> players,
    @Default({}) Map<String, Hole> holes,
    @Default(false) bool allPlayersJoined,
    @Default(1) int numberOfHoles,
    @Default(false) bool isFinished,
  }) = _Room;

  const Room._();

  bool hostPresent() {
      return players.values.any((player) => player.isHost);
  }

  bool duplicateName(String name) {
    return players.values.any((player) => player.name.toUpperCase() == name.toUpperCase());
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

}
