part of 'top_scorers_cubit.dart';

@immutable
sealed class TopScorersState {}

final class TopScorersInitial extends TopScorersState {}

final class TopScorersLoading extends TopScorersState {}

final class TopScorersSuccess extends TopScorersState {
  final TopScorersData response;
  TopScorersSuccess({required this.response});
}

final class TopScorersError extends TopScorersState {}
