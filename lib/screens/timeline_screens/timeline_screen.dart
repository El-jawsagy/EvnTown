import 'package:evntown/screens/timeline_screens/timeline_post_item.dart';
import 'package:evntown/screens/utilities_screen/drawer__screen.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';

class TimeLineScreen extends StatefulWidget {
  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  final TextEditingController _timeLineSearchControl =
      new TextEditingController();
  final GlobalKey<ScaffoldState> _timeLineScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _timeLineScaffoldKey,
      appBar: _drawPeopleSearchBar(),
      drawer: DrawerScreen(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return PostItem(
            img: post['img'],
            name: post['name'],
            dp: post['dp'],
            time: post['time'],
          );
        },
      ),
    );
  }

  Widget _drawPeopleSearchBar() {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Card(
          elevation: 6.0,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  _timeLineScaffoldKey.currentState.openDrawer();
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
                    hintText: "Search People..",
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
                  controller: _timeLineSearchControl,
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
}
