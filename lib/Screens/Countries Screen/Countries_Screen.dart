import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sports_app/Shared/Colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../Data/Models/Countries_Model.dart';

class Countries_Screen extends StatelessWidget {
  Countries_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future getPosition() async {
      bool services;

      services = await Geolocator.isLocationServiceEnabled();
      
      if (services == false) {
        AwesomeDialog(
            context: context,
            title: "Services",
            body: Text("Location Not Enabled"))
          ..show();
      }
    }

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/istockphoto-512735894-612x612.jpg',
              fit: BoxFit.fill,
            )),
        BlocBuilder<CountriesCubit, CountriesState>(
          builder: (context, state) {
            if (state is CountriesSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Your Location Here',
                                  style: TextStyle(color: AppColors.textcolor),
                                ),
                              )),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.location_on_sharp,
                          ),
                          onPressed: () {
                            getPosition();
                          },
                          iconSize: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
                        for (int i = 0; i < state.response.result.length; i++)
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 31,
                                  backgroundImage: NetworkImage(
                                    state.response.result[i].countryLogo ?? "",
                                    // height: MediaQuery.of(context).size.height * 0.12,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(state.response.result[i].countryName,
                                    style: TextStyle(color: Colors.white)),
                                // SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else
              return Text('error');
          },
        ),
      ]),
    ));
  }
}
