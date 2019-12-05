import 'package:evntown/screens/utilities_screen/drawer__screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'event_single_category.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = [
    "All Event",
    "Business",
    "Concerts",
    "Trip & Adventures",
    "Health & Wellness",
    "Workshops",
    "Entertainment",
    "Sports",
    "Art",
    "Theatre",
    "Crafts",
    "Food & Drink",
    "Conferences",
    "Comedy",
    "Photography",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.blue,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.blue),
            insets: EdgeInsets.symmetric(horizontal: 30.0),
          ),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 30.0),
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ProductList(),
                    ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
