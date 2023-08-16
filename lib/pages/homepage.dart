import 'package:flutter/material.dart';

import 'all_news.dart';
import 'breaking_news.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Center(child: const Text("Global News App")),
              backgroundColor: Colors.teal,
              bottom: const TabBar(
                automaticIndicatorColorAdjustment: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "Breaking News"),
                  Tab(text: "All News"),
                ],
              )),
          body: TabBarView(children: [
            BreakingNews(),
            AllNews(),
          ]),
        ));
  }
}
