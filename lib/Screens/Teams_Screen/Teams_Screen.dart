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
        backgroundColor: AppColors.primaryColor,
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
                        child: const Tab(
                          child: Text(
                            "Teams",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          //context.read<SubjectBloc>()
                        ),
                      ),
                      const Tab(
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
