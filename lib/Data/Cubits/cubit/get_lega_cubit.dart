import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Screens/Lega/lega.dart';

import '../../../../../Screens/Countries Screen/Countries_Screen.dart';
import '../../Repository/get_lega_repo.dart';
import '../Lega_cubit/get_lega_cubit.dart';

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
            MaterialPageRoute(builder: (context) => const Lega()),
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
