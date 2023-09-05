part of 'players_cubit.dart';

@immutable
sealed class PlayersState {}

final class PlayersInitial extends PlayersState {}

final class PlayersLoading extends PlayersState {}

final class PlayersSuccess extends PlayersState {
  final PlayersData response;
  PlayersSuccess({required this.response});
}

final class PlayersError extends PlayersState {}
