import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:evntown/screens/all_home_screens/trending_event.dart';
import 'package:evntown/screens/all_home_screens/trending_event_item.dart';
import 'package:evntown/screens/utilities_screen/drawer__screen.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/material.dart';

class HomeScreenNew extends StatefulWidget {
  @override
  _HomeScreenNewState createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew>
    with AutomaticKeepAliveClientMixin<HomeScreenNew> {
  final TextEditingController _homeSearchControl = new TextEditingController();
  final GlobalKey<ScaffoldState> _homeScaffoldKey =
      new GlobalKey<ScaffoldState>();

  PageController _featuresController;

  int featurePos = 1;

  List<Feature> _featuresIcons = [];

  Timer timer;

  List<Event> events = [];

  @override
  void initState() {
    _featuresController = PageController(
        initialPage: featurePos, keepPage: false, viewportFraction: 0.8);
    startTimerFeatures();
    _featuresIcons = featuresIcons();
    super.initState();
  }

  void startTimerFeatures() async {
    const oneSec = const Duration(seconds: 5);
    timer = new Timer.periodic(
      oneSec,
          (Timer timer) =>
              setState(
            () {
          if (featurePos < 3) {
            _featuresController.animateToPage(featurePos + 1,duration: oneSec,curve:Curves.ease );
          } else {
            featurePos = 0;
            _featuresController.jumpToPage(featurePos);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    events = getEvent();
    return Scaffold(
      key: _homeScaffoldKey,
      drawer: DrawerScreen(),
      appBar: _drawEventSearchBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Trending Events",
                  style: TextStyle(
                    color: Constants.whiteBG,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).accentColor,
                      ),
                      Text(
                        "(43)",
                        style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Trending();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            _drawTrendingEvent(),
            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category", 
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Constants.whiteBG,
                  ),
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).accentColor,
                      ),
                      Text(
                        "(9)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            _drawCategory(),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Today Events",
                  style: TextStyle(
                    fontSize: 23,
                    color: Constants.whiteBG,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).accentColor,
                      ),
                      Text(
                        "(59)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            _drawTodayEvent(),

            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "are you event organizer ?",
                  style: TextStyle(
                    fontSize: 23,
                    color: Constants.whiteBG,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            _drawFeatures(_featuresIcons)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _drawEventSearchBar() {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Card(
          elevation: 6.0,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  _homeScaffoldKey.currentState.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 9),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8,
                  maxHeight: MediaQuery.of(context).size.height * .09,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search Events..",
                    prefixIcon: Transform.translate(
                      offset:
                          Offset(-MediaQuery.of(context).size.width * .02, 0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _homeSearchControl,
                ),
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * .09,
      ),
    );
  }

  Widget _drawTrendingEvent() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: events == null ? 0 : events.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: TrendingItem(
              width: 0.8,
              height: 2.5,
              isPermote: false,
              imageHeight: 4.5,
              img: events[index].image,
              title: events[index].title,
              address: events[index].location,
              itemType: events[index].type,
              date: events[index].date,
            ),
          );
        },
      ),
    );
  }

  Widget _drawCategory() {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    cat["img"],
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.2, 0.7],
                        colors: [
                          cat['color1'],
                          cat['color2'],
                        ],
                        // stops: [0.0, 0.1],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                      padding: EdgeInsets.all(1),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          cat["name"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _drawTodayEvent() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width * .6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: events == null ? 0 : events.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: TrendingItem(
              width: 0.6,
              height: 4,
              isPermote: true,
              imageHeight: 6,
              img: events[index].image,
              title: events[index].title,
              address: events[index].location,
              itemType: events[index].type,
            ),
          );
        },
      ),
    );
  }

  Widget _drawFeatures(List<Feature> feat) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: <Widget>[
        PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: feat[position].backgroundColor,
                ),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * .5),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.2,
                      top: MediaQuery.of(context).size.height * .02,
                      child: CircleAvatar(
                        child: Icon(
                          feat[position].iconData,
                          size: 50,
                          color: Colors.white,
                        ),
                        radius: 55,
                      ),
                    ),
                    Center(
                      child: Transform.translate(
                        offset: Offset(0, 50),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            feat[position].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 4,
          controller: _featuresController,
          onPageChanged: (position) {
            setState(() {
              featurePos = position;
            });
          },
        ),
        Transform.translate(
          offset: Offset(0, -15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: feat.length,
              position: featurePos,
              decorator: DotsDecorator(
                color: Colors.white,
                activeColor: Colors.blue,
                size: Size(7, 7),
              ),
            ),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    _featuresController.dispose();
    _homeSearchControl.dispose();
    super.dispose();
  }
}
