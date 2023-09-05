import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Screens/Teams_Screen/TeamsButton.dart';
import 'package:sports_app/Screens/Teams_Screen/TopScorersButtons.dart';
import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';

// import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';
// import 'package:sports_app/Shared/Fonts.dart';

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
  late ScrollController _scrollController;
  late TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    iconTheme: IconThemeData(color: AppColors.textcolor),
                    expandedHeight: 100,
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
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            "Teams",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          //context.read<SubjectBloc>()
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
              body: const TabBarView(
                children: [
                  Material(child: TeamsButton()),
                  Material(child: TopScorersButtons())
                ],
              ))),
    );
  }
}
