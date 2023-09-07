import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';

import '../../Data/Cubits/Lega_cubit/get_lega_cubit.dart';
//import '../../Data/Cubits/Teams_Cubit/teams_cubit.dart';
import '../../Data/Cubits/cubit/teams_cubit.dart';
import '../../Shared/Colors.dart';
import '../../Shared/Drawer_List.dart';
import '../../Shared/Drawer_header.dart';
import '../../Shared/Fonts.dart';

class Lega extends StatelessWidget {
  const Lega({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.textcolor),
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            title: Text(
              'Leagues',
              style: TextStyle(color: AppColors.textcolor),
            ),
            centerTitle: true,
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Container(
                //     height: MediaQuery.of(context).size.height,
                //     color: Color.fromARGB(179, 199, 197, 196),
                //     child: Image.asset(
                //       'assets/Soccer.jpg',
                //       fit: BoxFit.fill,
                //     )),
                BlocBuilder<GetLegaCubit, GetLegaState>(
                  builder: (context, state) {
                    if (state is GetLegaSuccess) {
                      return ListView.builder(
                        itemCount: state.response.result!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(3.0),
                            child: InkWell(
                              onTap: () {
                                context.read<TeamsCubit>().getTeams(context,
                                    legaID: state
                                        .response.result![index].leagueKey
                                        .toString());
                                context.read<TopScorersCubit>().getTopScorers(
                                    context,
                                    legaID: state
                                        .response.result![index].leagueKey
                                        .toString());
                              },
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: AppColors.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(state
                                                    .response
                                                    .result![index]
                                                    .leagueLogo ??
                                                ""),
                                            radius: 50,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.response.result![index]
                                                      .leagueName ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: AppFonts.fontsize16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.textcolor),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: const Text("error"));
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

enum Draweritem {
  home,
  profile,
  settings,
}
