import 'dart:math';

import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SingleEventScreen extends StatefulWidget {
  @override
  _SingleEventScreenState createState() => _SingleEventScreenState();
}

class _SingleEventScreenState extends State<SingleEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff263238),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGradientAppBar(
            title: Text('Event Name'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.filter_list,
                ),
                onPressed: () {
                  //todo: make show pop up button with two choose
                },
              )
            ],
            expandedHeight: 135.0,
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.indigo]),
                          color: Colors.grey.shade800,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ticket online',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        //todo:link button with link of ticket
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.indigo]),
                          color: Colors.grey.shade800,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Contact organizer',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        //todo:link button with massage screen to send massages
                      },
                    )
                  ],
                ),
              ),
              preferredSize: null,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/profile_image.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.height,
            delegate: SliverChildListDelegate(
              [
                Card(
                  color: Colors.grey.shade800,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(children: <Widget>[
                      Column(
                        children: <Widget>[
                          _drawAddressRow(),
                          _drawDateRow(),
                          _drawTimeRow(),
                          _drawDetailsRow(),
                          _drawDescription(),
                          _drawTagsRow(),
                          _drawCommentRow(),
                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: _drawMapButton()),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawAddressRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Address: ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Center(
              child: Text(
                "El Sharkia, Zagazig, Belbies, Saad Zaghlol, El Ansary  ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDateRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Date: ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Center(
              child: Text(
                "Jan 25, 2020 - Jan 29,2020",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawTimeRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Time: ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Center(
              child: Text(
                "7:30  PM",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDetailsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Details :",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                color: Color(0xff263238),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'Going',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.checkDouble,
                      size: 12,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .03,
              ),
              RaisedButton(
                color: Color(0xff263238),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'Intersted',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.star,
                      size: 12,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: Text(
                "description for event and this will copy and repeat more than 3 times description for event and this will copy and repeat more than 2 times description for event and this will copy and repeat more than 1 times description for event and this will copy and repeat more than 0 times",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                maxLines: 8,
                textAlign: TextAlign.center,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Tags :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisSpacing: 1,
                                childAspectRatio: 3),
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
                        itemCount: 9,
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

  Widget _drawCommentRow() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // todo: link it with comments screen
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .04,
                        ),
                        Text(
                          "109 comments",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    //todo: link it with popup menu
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawMapButton() {
    return InkWell(
      onTap: () {
        //todo: link it with maps and send location
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade800,
                      Colors.tealAccent.shade700,
                      Colors.teal.shade800,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              child: Center(
                child: Text(
                  "Go to address in Map",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  maxLines: 8,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
