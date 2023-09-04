import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Shared/Colors.dart';


import '../Shared/Drawer_List.dart';
import '../Shared/Drawer_header.dart';

import '../Data/Cubits/Countries_cubit/countries_cubit.dart';


class home_screen extends StatelessWidget {
  home_screen({super.key});

  List name = ["Basketball", "tennis", "Cricket"];
  List logo = [
    "assets/pngegg.png",
    "assets/pngwing.com (1).png",
    "assets/pngwing.com.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // left: true,
      // right: true,
      top: true,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.textcolor),
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          drawer: Drawer(
              backgroundColor: AppColors.textcolor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyDrawerHeader(),
                    MyDrawerList(v: Draweritem.home),
                  ],
                ),
              )),
          backgroundColor: AppColors.primaryColor,
          body: Column(
            children: [
              const SizedBox(height: 10),
              const Text("Choose Your Favourite Sport",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              const SizedBox(height: 100),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<CountriesCubit, CountriesState>(
                        builder: (context, state) {
                          if(state is CountriesLoading)
                          return CircularProgressIndicator();
                          else if(state is CountriesSuccess || state is CountriesInitial){
                          return InkWell(
                            onTap: () {
                              context
                                  .read<CountriesCubit>()
                                  .getCountries(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.secondaryColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/image 132.png",
                                      width: 50, height: 50),
                                  const Text(
                                    "Football",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                          );
                          }
                          else {
                            return Text('error');
                          }
                        },
                      ),
                    ),
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Coming Soon",
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                    content: Text(' stay tuned',
                                        style: TextStyle(
                                            color: AppColors.primaryColor)),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text('Close '))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.secondaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(logo[i], width: 50, height: 50),
                                Text(
                                  name[i],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
