import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/cubit/cubit/get_lega_cubit.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sports_app/Shared/Colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geocoding/geocoding.dart';

import '../../Data/Models/Countries_Model.dart';

GlobalKey key = GlobalKey();

class Countries_Screen extends StatelessWidget {
  Countries_Screen({super.key});

  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/istockphoto-512735894-612x612.jpg',
                  fit: BoxFit.fill,
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                BlocBuilder<LocationCubitCubit, LocationCubitState>(
                  builder: (context, state) {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                context.read<LocationCubitCubit>().location,
                                style: TextStyle(color: AppColors.textcolor),
                              ),
                            )),
                      ),
                      IconButton(
                        onPressed: () async {
                          await context
                              .read<LocationCubitCubit>()
                              .getPosition(context);

                          RenderBox box = key.currentContext?.findRenderObject()
                              as RenderBox;
                          Offset position = box.localToGlobal(
                              Offset.zero); //this is global position
                          double y = position.dy;

                          sc.animateTo(y,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        icon: Icon(
                          Icons.location_on_sharp,
                        ),
                        iconSize: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.white,
                      )
                    ]);
                  },
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: BlocBuilder<CountriesCubit, CountriesState>(
                    builder: (context, state) {
                      if (state is CountriesSuccess) {
                        return GridView.count(
                          controller: sc,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: <Widget>[
                            for (int i = 0;
                                i < state.response.result.length;
                                i++)
                              BlocBuilder<GetLegaCubit, GetLegaState>(
                                builder: (context, state) {
                                  if (state is GetLegaLoading) {
                                    return CircularProgressIndicator();
                                  } else if (state is GetLegaSuccess) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Column(children: [
                                        if (context
                                                .read<LocationCubitCubit>()
                                                .s ==
                                            state.response.result?[i]
                                                .countryName)
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 4,
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: CircleAvatar(
                                              radius: 31,
                                              backgroundImage: NetworkImage(
                                                state.response.result?[i]
                                                        .countryLogo ??
                                                    "",
                                                // height: MediaQuery.of(context).size.height * 0.12,
                                              ),
                                            ),
                                            key: key,
                                          ),
                                        if (context
                                                .read<LocationCubitCubit>()
                                                .s !=
                                            state.response.result?[i]
                                                .countryName)
                                          CircleAvatar(
                                            backgroundColor:
                                                AppColors.secondaryColor,
                                            radius: 31,
                                            backgroundImage: NetworkImage(
                                              state.response.result?[i]
                                                      .countryLogo ??
                                                  "",
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                            state.response.result?[i]
                                                .countryName as String,
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ]),
                                    );
                                  } else {
                                    return const Text('Something Went Wrong !');
                                  }
                                },
                              )
                          ],
                        );
                      } else {
                        return const Text('Something Went Wrong !');
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
