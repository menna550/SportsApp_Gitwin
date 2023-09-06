//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Repository/Countries_Repo.dart';
import 'package:sports_app/Screens/Countries%20Screen/Countries_Screen.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  GetCountriesRepo countriesRepo = GetCountriesRepo();

  getCountries(context) async {
    emit(CountriesLoading());

    try {
      await countriesRepo.getCountries().then((value) {
        if (value != null) {
          emit(CountriesSuccess(response: value));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Countries_Screen()),
          );
        } else {
          emit(CountriesError());
        }
      });
    } catch (error) {
      emit(CountriesError());
    }
  }

  



}
