import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
//import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Players_Model.dart';
import 'package:sports_app/Screens/Players_Screen/players.dart';

import '../../Repository/Players_Repo.dart';
//import 'package:sports_app/Data/Repository/Countries_Repo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  GetPlayersRepo playersRepo = GetPlayersRepo();

  getPlayers(context, {required String teamID}) async {
    emit(PlayersLoading());

    try {
      await playersRepo.getPlayers(teamID).then((value) {
        if (value != null) {
          emit(PlayersSuccess(response: value));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlayersScreen()),
          );
        } else {
          emit(PlayersError());
        }
      });
    } catch (error) {
      emit(PlayersError());
    }
  }
}
