import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Repository/Countries_Repo.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  GetCountriesRepo countriesRepo = GetCountriesRepo();

  getCountries() async {
    emit(CountriesLoading());

    try {
      await countriesRepo.getCountries().then((value) {
        if (value != null) {
          emit(CountriesSuccess(response: value));
        } else {
          emit(CountriesError());
        }
      });
    } catch (error) {
      emit(CountriesError());
    }
  }















}
