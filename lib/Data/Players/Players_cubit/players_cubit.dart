import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Players/Models/Players_Model.dart';
//import 'package:sports_app/Data/Repository/Countries_Repo.dart';

import '../Repository/Players_Repo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  GetPlayersRepo playersRepo = GetPlayersRepo();

  getPlayers() async {
    emit(PlayersLoading());

    try {
      await playersRepo.getPlayers().then((value) {
        if (value != null) {
          emit(PlayersSuccess(response: value));
        } else {
          emit(PlayersError());
        }
      });
    } catch (error) {
      emit(PlayersError());
    }
  }
}
