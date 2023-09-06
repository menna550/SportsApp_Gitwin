import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_cubit_state.dart';

class LocationCubitCubit extends Cubit<LocationCubitState> {
  LocationCubitCubit() : super(LocationCubitInitial());

  String s = "", street = "", location = "";

  Future getPosition(context) async {
    bool services;
    Position pos;

    services = await Geolocator.isLocationServiceEnabled();
    LocationPermission per;

    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "Services",
          body: Text("Location Not Enabled"))
        ..show();
    }

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();

      if (per == LocationPermission.always) {
        Future<Position> getlatAndlong() async {
          pos = await Geolocator.getCurrentPosition().then((value) => value);
          //  print(pos.latitude);
          //  print(pos.longitude);
          return pos;
        }
      }
    } else if (per == LocationPermission.always ||
        per == LocationPermission.whileInUse) {
      Future<Position> getlatAndlong() async {
        return await Geolocator.getCurrentPosition().then((value) => value);
        //  print(pos.latitude);
        //  print(pos.longitude);
      }

      pos = await getlatAndlong();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      // print(placemarks[0].country);
      s = placemarks[0].country as String;
      street = placemarks[0].street as String;
      location = "${placemarks[0].locality as String} , ${s} ";
    }

    emit(LocationCubitInitial());
  }

  render(){
    emit(LocationCubitn());
  }
}
