import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:sports_app/Data/Models/Teams_Model.dart';
import 'package:sports_app/Screens/Teams_Screen/try.dart';
import '../../../Screens/Teams_Screen/Teams_Screen.dart';
import '../../Repository/Teams_Repo.dart';
part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitial());

  GetTeamsRepo teamsRepo = GetTeamsRepo();

  getTeams(context, {required String legaID}) async {
    emit(TeamsLoading());

    try {
      await teamsRepo.getTeams(legaID).then((value) {
        if (value != null) {
          emit(TeamsSuccess(response: value));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Teams_Screen()),
          );
        } else {
          emit(TeamsError());
        }
      });
    } catch (error) {
      emit(TeamsError());
    }
  }
}
