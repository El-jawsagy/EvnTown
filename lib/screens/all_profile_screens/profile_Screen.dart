import 'dart:math';

import 'package:evntown/screens/event_screens/trending_event.dart';
import 'package:evntown/screens/event_screens/trending_event_item.dart';
import 'package:evntown/screens/utilities_screen/drawer__screen.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  static Random random = Random();

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    events = getEvent();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          InkWell(
            hoverColor: Colors.white,
            onTap: (//todo: make user copy his link
                ) {},
            child: Center(
              child: Text(
                "Copy Link profile",
                style: TextStyle(
                  color: Constants.blue,
                ),
              ),
            ),
          ),
          DrawPopUpMenu(),
        ],
      ),
      drawer: DrawerScreen(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 1.3),
            height: MediaQuery.of(context).size.height * 1.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile_image.jpg",
                  ),
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  names[random.nextInt(10)],
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Status should be here",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                _drawFollowersRow(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                _drawTagsRow(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushNamed(context, '/chat');
                      },
                    ),
                    SizedBox(width: 10),
                    FlatButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        //todo:make user add
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      _drawTabBar(),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawFollowersRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'friends');
            },
            child: Text(
              "${Random().nextInt(360).toString()} Following",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'friends');
            },
            child: Text(
              "${Random().nextInt(360).toString()} Followers",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawTagsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Favorite events:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: GridView.builder(
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 1,
                                childAspectRatio: 1.9),
                        physics: ScrollPhysics(),
                        itemBuilder: (context, pos) {
                          Map cat =
                              categories[Random().nextInt(categories.length)];
                          return InkWell(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                cat['name'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        itemCount: Random().nextInt(6),
                        shrinkWrap: true,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawTabBar() {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .6),
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Constants.whiteBG,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TabBar(
              labelColor: Constants.darkGrayBG,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Stories",
                ),
                Tab(
                  text: "Events",
                ),
                Tab(
                  text: "Points",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _drawPostsTab(),
                  _drawEventsTab(),
                  _drawPointsTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPostsTab() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(5),
      itemCount: 15,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 200 / 200,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onLongPress: () {
            //todo : Link with alert dialog to view story
          },
          onDoubleTap: () {
            //todo : Link with alert dialog to view story
          },
          onTap: () {
            //todo : Link with alert dialog to view story
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Image.asset(
              "assets/images/trip_adventures.jpg",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _drawEventsTab() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "My Events",
                    style: TextStyle(
                      color: Constants.whiteBG,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
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
                        "(2)",
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

                //Horizontal List here
              ],
            ),
            SizedBox(height: 5.0),
            _drawMyEvent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Going & Intersting Events",
                    style: TextStyle(
                      color: Constants.whiteBG,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
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
                        "(${events.length})",
                        style: TextStyle(
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

                //Horizontal List here
              ],
            ),
            SizedBox(height: 5.0),
            _drawGoingAndInterestingEvents(),
          ],
        ),
      ],
    );
  }

  Widget _drawMyEvent() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.3,
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
              width: 0.5,
              height: 6,
              isPermote: Random().nextBool(),
              imageHeight: 8,
              img: events[index].image,
              title: events[index].title,
              address: events[index].location,
              icon: Icons.edit,
              itemType: events[index].type,
              date: events[index].date,
              titleSize: 14,
              itemTypeSize: 12,
              addressSize: 10,
              dateSize: 9,
              color: Constants.blue,
            ),
          );
        },
      ),
    );
  }

  Widget _drawGoingAndInterestingEvents() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.3,
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
              width: 0.5,
              height: 6,
              imageHeight: 8,
              img: events[index].image,
              title: events[index].title,
              address: events[index].location,
              icon: Icons.edit,
              itemType: events[index].type,
              date: events[index].date,
              titleSize: 14,
              itemTypeSize: 12,
              addressSize: 10,
              isPermote: false,
              dateSize: 9,
              color: Constants.blue,
            ),
          );
        },
      ),
    );
  }

  Widget _drawPointsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            " Your Points is ",
            style: TextStyle(color: Constants.whiteBG, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "11646",
            style: TextStyle(color: Constants.whiteBG, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            disabledElevation: 10,
            color: Constants.blue,
            onPressed: () {},
            child: Text(
              "Play Now",
              style: TextStyle(color: Constants.whiteBG, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawPopUpMenu extends StatefulWidget {
  @override
  _DrawPopUpMenuState createState() => _DrawPopUpMenuState();
}

class _DrawPopUpMenuState extends State<DrawPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        Navigator.pushNamed(context, "/$result");
      },
      enabled: true,
      onCanceled: () {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: PagesForPopup.addEvent,
          child: ListTile(
            title: Text(
              "Create Event",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.create,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.eventHistory,
          child: ListTile(
            title: Text(
              "Events History",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.history,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.settings,
          child: ListTile(
            title: Text(
              "settings",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.notification,
          child: ListTile(
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.notifications,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.addFriends,
          child: ListTile(
            title: Text(
              "Find Friends",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.person_add,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.about,
          child: ListTile(
            title: Text(
              "About Us",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.help,
              size: 20,
              color: Colors.blueAccent,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.help,
          child: ListTile(
            title: Text(
              "Need Help",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              FontAwesomeIcons.handsHelping,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.feed,
          child: ListTile(
            title: Text(
              "Feedback",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.feedback,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: PagesForPopup.cancel,
          child: ListTile(
            title: Text(
              "Cancel",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
