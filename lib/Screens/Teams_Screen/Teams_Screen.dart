import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Screens/Teams_Screen/TeamsButton.dart';
import 'package:sports_app/Screens/Teams_Screen/TopScorers.dart';
import 'package:sports_app/Screens/Teams_Screen/searchForData.dart';

import '../../Shared/Colors.dart';

class Teams_Screen extends StatefulWidget {
  const Teams_Screen({super.key});

  @override
  State<Teams_Screen> createState() => _Teams_ScreenState();
}

class _Teams_ScreenState extends State<Teams_Screen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  late TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool isScroll) {
            return [
              SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.primaryColor,
                  // Add this line to create a search button
                  actions: [
                    AnimSearchBar(
                      width: 400,
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
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 20, left: 10),
                        child: TabBar(
                            indicatorPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: const EdgeInsets.only(right: 50),
                            controller: _tabController,
                            isScrollable: true,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: const Offset(0, 0),
                                  )
                                ]),
                            tabs: [
                              Container(
                                height: 50,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ]),
                                child: const Text(
                                  "Teams",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ]),
                                child: const Text(
                                  "Top Scorers",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ])),
                  ))
            ];
          },
          body: TabBarView(controller: _tabController, children: const [
            Material(child: TeamsButton()),
            Material(child: TopScorers())
          ])),
    );
  }
}
