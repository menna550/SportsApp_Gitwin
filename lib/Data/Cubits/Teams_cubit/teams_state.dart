part of 'teams_cubit.dart';

@immutable
sealed class TeamsState {}

final class TeamsInitial extends TeamsState {}

final class TeamsLoading extends TeamsState {}

final class TeamsSuccess extends TeamsState {
  final TeamsData response;
  TeamsSuccess({required this.response});
}

final class TeamsError extends TeamsState {}
