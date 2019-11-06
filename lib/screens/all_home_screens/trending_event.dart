import 'dart:math';

import 'package:evntown/screens/all_home_screens/trending_event_item.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final TextEditingController _searchControl = new TextEditingController();

  List<Event> events = [];



  @override
  Widget build(BuildContext context) {
    events = getEvent();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Trending Restaurants"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 6.0,
              child: Container(
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
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search..",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: events == null ? 0 : events.length,
              itemBuilder: (BuildContext context, int index) {
                return TrendingItem(
                  width: 0.8,
                  height: 2.5,
                  imageHeight: 4.5,
                  img: events[index].image,
                  title: events[index].title,
                  address: events[index].location,
                  itemType: events[index].type,
                  isPermote: Random().nextBool(),
                  date: events[index].date,
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
