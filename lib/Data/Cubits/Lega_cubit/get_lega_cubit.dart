import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Screens/Lega/lega.dart';

import '../../../../../Screens/Countries Screen/Countries_Screen.dart';
import '../../Models/Lega_Model.dart';
import '../../Repository/get_lega_repo.dart';

part 'get_lega_state.dart';

class GetLegaCubit extends Cubit<GetLegaState> {
  GetLegaCubit() : super(GetLegaInitial());
  GetLegaRepo legaRepo = GetLegaRepo();

  getLega(context) async {
    emit(GetLegaLoading());

    try {
      await legaRepo.getLega().then((value) {
        if (value != null) {
          emit(GetLegaSuccess(response: value));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Countries_Screen()),
          );
        } else {
          emit(GetLegaError());
        }
      });
    } catch (error) {
      emit(GetLegaError());
    }
  }
}
