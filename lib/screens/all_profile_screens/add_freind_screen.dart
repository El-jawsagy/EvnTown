import 'dart:math';

import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFriendScreen extends StatefulWidget {
  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  //todo:modify friends Screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration.collapsed(
              hintText: 'Search About Friends',
              hoverColor: Constants.whiteBG,
              hintStyle: TextStyle(color: Constants.lightGray)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16),
            child: Text(
              "Top Organizers ",
              style: TextStyle(
                fontSize: 24,
                color: Constants.whiteBG,
              ),
            ),
          ),
          _drawOrganizerAdd(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16),
            child: Text(
              "Suggested Friends ",
              style: TextStyle(
                fontSize: 24,
                color: Constants.whiteBG,
              ),
            ),
          ),
          _drawFriendsCards(),
        ],
      ),
    );
  }

  Widget _drawOrganizerAdd() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .4,
        maxHeight: MediaQuery.of(context).size.height * 0.24,
      ),
      child: ListView.builder(
        itemBuilder: (context, pos) {
          Map friend = friends[pos];
          return InkWell(
            onTap: () {
              //todo: make user Navigate to organizer account
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: ExactAssetImage(friend["dp"]),
                      radius: 40),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .28,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Text(
                      friend['name'],
                      style: TextStyle(color: Constants.whiteBG, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: friends.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _drawFriendsCards() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .65,
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: ListView.builder(
        itemBuilder: (context, pos) {
          Map friend = friends[pos];
          return InkWell(
            onTap: () {
              //todo: make user Navigate to friend account
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: ExactAssetImage(
                        friend['dp'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .55,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _drawColumnInCard(friend),
                      )
                    ],
                  )),
            ),
          );
        },
        itemCount: friends.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _drawColumnInCard(Map friend) {
    return Container(
      width: MediaQuery.of(context).size.width * .55,
      height: MediaQuery.of(context).size.height * 0.19,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            friend['name'],
            style: TextStyle(
                color: Constants.whiteBG,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          _drawTagsRow(),
          _drawButtonsRow(friend['isAccept'])
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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Favorite events :",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.53),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: GridView.builder(
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.1,
                                childAspectRatio: 2.6),
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
                                    fontSize: 9,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
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

  Widget _drawButtonsRow(bool isAccept) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .55,
            maxHeight: MediaQuery.of(context).size.height * .05,
          ),
          width: MediaQuery.of(context).size.width * .55,
          height: MediaQuery.of(context).size.height * .05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {
                  //todo: make user go to chat massage
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Constants.blue),
                  child: Center(
                    child: Text(
                      "Massage",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //todo: check and make change @isAccept
                },
                child: isAccept
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.gray),
                        child: Center(
                          child: Text(
                            "Unfollow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.blue),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}

//itemBuilder: (BuildContext context, int index) {
//return Padding(
//padding: const EdgeInsets.symmetric(horizontal: 8.0),
//child: ListTile(
//leading: CircleAvatar(
//backgroundImage: AssetImage(
//friend['dp'],
//),
//radius: 25,
//),
//
//contentPadding: EdgeInsets.all(0),
//title: Text(
//friend['name'], style: TextStyle(color: Constants.whiteBG),),
//subtitle: Text(friend['status'],
//style: TextStyle(color: Constants.whiteBG)),
//trailing:
//onTap: (){},
//),);
//},
