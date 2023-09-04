part of 'get_lega_cubit.dart';

@immutable
sealed class GetLegaState {}

final class GetLegaInitial extends GetLegaState {}

final class GetLegaLoading extends GetLegaState {}

final class GetLegaSuccess extends GetLegaState {
  final GetLegaModel response;
  GetLegaSuccess({required this.response});
}

final class GetLegaError extends GetLegaState {}
