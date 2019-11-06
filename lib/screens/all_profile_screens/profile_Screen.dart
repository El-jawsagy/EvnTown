import 'dart:math';

import 'package:evntown/screens/all_home_screens/trending_event.dart';
import 'package:evntown/screens/all_home_screens/trending_event_item.dart';
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

enum WhyFarther {
  addEvent,
  eventHistory,
  interestEvent,
  notification,
  addFriends,
  about,
  help,
  feed,
  logOut
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
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther result) {
              Navigator.pushNamed(context, "/${result.toString()}");
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.addEvent,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.eventHistory,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.interestEvent,
                child: ListTile(
                  title: Text(
                    "Interest Events",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.star_border,
                    color: Colors.blueAccent,
                    size: 20,
                  ),
                ),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.notification,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.addFriends,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.about,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.help,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.feed,
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
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.logOut,
                child: ListTile(
                  title: Text(
                    "Logout",
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
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "100 Following",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      "150 Followers",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 25),
              Expanded(
                child: Column(
                  children: <Widget>[
                    _drawTabBar(),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawTabBar() {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .45),
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
                  _drawPosts(),
                  _drawEvents(),
                  _drawPoints(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPosts() {
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
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/images/trip_adventures.jpg",
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _drawEvents() {
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
            _drawTrendingEvent(),
          ],
        ),
      ],
    );
  }

  Widget _drawTrendingEvent() {
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

  Widget _drawPoints() {
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
              "Gain some points",
              style: TextStyle(color: Constants.whiteBG, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
