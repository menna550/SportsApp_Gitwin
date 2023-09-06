// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_app/Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// import 'package:sports_app/Screens/Players_Screen/test.dart';
// import 'package:sports_app/Screens/Teams_Screen/TeamsButton.dart';
// import 'package:sports_app/Screens/Teams_Screen/TopScorersButtons.dart';
// import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';

// // import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';
// // import 'package:sports_app/Shared/Fonts.dart';

// import '../../Shared/Colors.dart';
// import '../../Shared/Drawer_List.dart';
// import '../../Shared/Drawer_header.dart';

// class Teams_Screen extends StatefulWidget {
//   const Teams_Screen({super.key});

//   @override
//   State<Teams_Screen> createState() => _Teams_ScreenState();
// }

// class _Teams_ScreenState extends State<Teams_Screen>
//     with SingleTickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late TextEditingController textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           drawer: Drawer(
//               backgroundColor: AppColors.textcolor,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const MyDrawerHeader(),
//                     MyDrawerList(v: Draweritem.home),
//                   ],
//                 ),
//               )),
//           body: NestedScrollView(
//               controller: _scrollController,
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return [
//                   SliverAppBar(
//                     iconTheme: IconThemeData(color: AppColors.textcolor),
//                     expandedHeight: 100,
//                     pinned: true,
//                     floating: true,
//                     forceElevated: innerBoxIsScrolled,
//                     backgroundColor: AppColors.primaryColor,
//                     actions: [
//                       Padding(
//                         padding: const EdgeInsets.all(7.0),
//                         child: AnimSearchBar(
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           textController: textController,
//                           onSuffixTap: () {
//                             setState(() {
//                               textController.clear();
//                             });
//                           },
//                           onSubmitted: (text) {
//                             // Do something wit h the text, such as searching for data
//                             searchForData(text);
//                           },
//                           color: AppColors.secondaryColor,
//                           autoFocus: true,
//                           closeSearchOnSuffixTap: true,
//                           animationDurationInMilli: 1000,
//                           searchIconColor: Colors.white,
//                           rtl: true,
//                         ),
//                       )
//                     ],
//                     bottom: const TabBar(
//                       tabs: [
//                         Tab(
//                           child: Text(
//                             "Teams",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           //context.read<SubjectBloc>()
//                         ),
//                         Tab(
//                           child: Text(
//                             "Top Scorers",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ];
//               },
//               body: TabBarView(
//                 children: [
//                   Material(child: TeamsButton()),
//                   Material(child: TopScorersButtons())
//                 ],
//               ))),
//     );
//   }
// }

// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_app/Screens/Teams_Screen/TeamsButton.dart';
// import 'package:sports_app/Screens/Teams_Screen/TopScorersButtons.dart';
// import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';

// // import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';
// // import 'package:sports_app/Shared/Fonts.dart';

// import '../../Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// import '../../Data/Cubits/cubit/teams_cubit.dart';
// import '../../Shared/Colors.dart';
// import '../../Shared/Drawer_List.dart';
// import '../../Shared/Drawer_header.dart';

// class Teams_Screen extends StatefulWidget {
//   const Teams_Screen({super.key});

//   @override
//   State<Teams_Screen> createState() => _Teams_ScreenState();
// }

// class _Teams_ScreenState extends State<Teams_Screen>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   late ScrollController _scrollController;
//   late TextEditingController textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     // Initialize the tab controller with two tabs
//     tabController = TabController(length: 2, vsync: this);
//     // Fetch the data for each tab when it becomes active
//     tabController.addListener(() {
//       if (tabController.index == 0) {
//         context.read<TeamsCubit>().getTeams(context);
//       } else if (tabController.index == 1) {
//         context.read<TopScorersCubit>().getTopScorers(context);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: Drawer(
//             backgroundColor: AppColors.textcolor,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const MyDrawerHeader(),
//                   MyDrawerList(v: Draweritem.home),
//                 ],
//               ),
//             )),
//         body: NestedScrollView(
// //               controller: _scrollController,
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return [
//                 SliverAppBar(
//                   iconTheme: IconThemeData(color: AppColors.textcolor),
//                   expandedHeight: 100,
//                   snap: true,
//                   pinned: true,
//                   floating: true,
//                   forceElevated: innerBoxIsScrolled,
//                   backgroundColor: AppColors.primaryColor,
//                   actions: [
//                     Padding(
//                       padding: const EdgeInsets.all(7.0),
//                       child: AnimSearchBar(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         textController: textController,
//                         onSuffixTap: () {
//                           setState(() {
//                             textController.clear();
//                           });
//                         },
//                         onSubmitted: (text) {
//                           // Do something wit h the text, such as searching for data
//                           searchForData(text);
//                         },
//                         color: AppColors.secondaryColor,
//                         autoFocus: true,
//                         closeSearchOnSuffixTap: true,
//                         animationDurationInMilli: 1000,
//                         searchIconColor: Colors.white,
//                         rtl: true,
//                       ),
//                     )
//                   ],
//                   bottom: TabBar(
//                     controller: tabController,
//                     tabs: [
//                       Tab(
//                         child: Text(
//                           "Teams",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         //context.read<SubjectBloc>()
//                       ),
//                       Tab(
//                         child: Text(
//                           "Top Scorers",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ];
//             },
//             body: TabBarView(
//               controller: tabController,
//               children: [
//                 // Material(child: TeamsButton()),
//                 // Material(child: TopScorersButtons())
//                 // The teams tab
//                 BlocProvider.value(
//                   value: BlocProvider.of<TeamsCubit>(context),
//                   child: TeamsButton(),
//                 ),
//                 // The top scorers tab
//                 BlocProvider.value(
//                   value: BlocProvider.of<TopScorersCubit>(context),
//                   child: TopScorersButtons(),
//                 ),
//               ],
//             )));
//   }
// }

// body: TabBarView(
//           controller: tabController,
//           children: [
//             // The teams tab
//             BlocBuilder<TeamsCubit, TeamsState>(
//               builder: (context, state) {
//                 if (state is TeamsInitial) {
//                   // Fetch the teams when the tab is first opened
//                   context.read<TeamsCubit>().getTeams();
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is TeamsLoading) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is TeamsLoaded) {
//                   return _buildTeamsList(state.teams);
//                 } else if (state is TeamsError) {
//                   return Center(child: Text(state.message));
//                 } else {
//                   return Center(child: Text('Unknown state'));
//                 }
//               },
//             ),
//             // The top scorers tab
//             BlocBuilder<TopScorersCubit, TopScorersState>(
//               builder: (context, state) {
//                 if (state is TopScorersInitial) {
//                   // Fetch the top scorers when the tab is first opened
//                   context.read<TopScorersCubit>().getTopScorers();
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is TopScorersLoading) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is TopScorersLoaded) {
//                   return _buildTopScorersList(state.topScorers);
//                 } else if (state is TopScorersError) {
//                   return Center(child: Text(state.message));
//                 } else {
//                   return Center(child: Text('Unknown state'));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // A helper method to build the list of teams
//   Widget _buildTeamsList(List<String> teams) {
//     return CustomScrollView(
//       key: PageStorageKey('teams'),
//       slivers: [
//         // A widget that absorbs the overlap of the app bar
//         SliverOverlapAbsorber(
//           handle:
//               NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//           sliver: SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   title: Text(teams[index]),
//                 );
//               },
//               childCount: teams.length,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // A helper method to build the list of top scorers
//   Widget _buildTopScorersList(List<String> topScorers) {
//     return CustomScrollView(
//       key: PageStorageKey('top_scorers'),
//       slivers: [
//         // A widget that absorbs the overlap of the app bar
//         SliverOverlapAbsorber(
//           handle:
//               NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//           sliver: SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   title: Text(topScorers[index]),
//                 );
//               },
//               childCount: topScorers.length,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Screens/Teams_Screen/TeamsButton.dart';
import 'package:sports_app/Screens/Teams_Screen/TopScorersButtons.dart';
import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';

// import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';
// import 'package:sports_app/Shared/Fonts.dart';

import '../../Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
import '../../Data/Cubits/cubit/teams_cubit.dart';
import '../../Shared/Colors.dart';
import '../../Shared/Drawer_List.dart';
import '../../Shared/Drawer_header.dart';

class Teams_Screen extends StatefulWidget {
  const Teams_Screen({super.key});

  @override
  State<Teams_Screen> createState() => _Teams_ScreenState();
}

class _Teams_ScreenState extends State<Teams_Screen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late ScrollController _scrollController;
  late TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Initialize the tab controller with two tabs
    tabController = TabController(length: 2, vsync: this);
    // Fetch the data for each tab when it becomes active
    // tabController.addListener(() {
    //   if (tabController.index == 0) {
    //     context.read<TeamsCubit>().getTeams(
    //           context,
    //         );
    //   } else if (tabController.index == 1) {
    //     context.read<TopScorersCubit>().getTopScorers(context);
    //   }
    // });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            backgroundColor: AppColors.textcolor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MyDrawerHeader(),
                  MyDrawerList(v: Draweritem.home),
                ],
              ),
            )),
        body: NestedScrollView(
//               controller: _scrollController,
            headerSliverBuilder:
                (/*BuildContext*/ context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  iconTheme: IconThemeData(color: AppColors.textcolor),
                  expandedHeight: 100,
                  snap: true,
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: AppColors.primaryColor,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: AnimSearchBar(
                        width: MediaQuery.of(context).size.width * 0.8,
                        textController: textController,
                        onSuffixTap: () {
                          setState(() {
                            textController.clear();
                          });
                        },
                        onSubmitted: (text) {
                          // Do something wit h the text, such as searching for data
                          searchForData(text);
                        },
                        color: AppColors.secondaryColor,
                        autoFocus: true,
                        closeSearchOnSuffixTap: true,
                        animationDurationInMilli: 1000,
                        searchIconColor: Colors.white,
                        rtl: true,
                      ),
                    )
                  ],
                  bottom: TabBar(
                    controller: tabController,
                    tabs: [
                      BlocProvider(
                        create: (context) => TeamsCubit(),
                        child: Tab(
                          child: Text(
                            "Teams",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          //context.read<SubjectBloc>()
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Top Scorers",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: [
                // The teams tab
                BlocProvider.value(
                  value: BlocProvider.of<TeamsCubit>(context),
                  child: TeamsButton(),
                ),
                // The top scorers tab
                BlocProvider.value(
                  value: BlocProvider.of<TopScorersCubit>(context),
                  child: TopScorersButtons(),
                ),
              ],
            )));
  }
}
