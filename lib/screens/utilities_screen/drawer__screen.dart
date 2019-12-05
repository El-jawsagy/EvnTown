import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  List<DrawerItem> drawerItems = [];

  @override
  Widget build(BuildContext context) {
    drawerItems = getItem();
    return Drawer(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        color: Color(0xff063238),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Colors.grey,
                          Colors.blueGrey,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade800, spreadRadius: .75),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: ExactAssetImage(
                          "assets/images/profile_image.jpg",
                        ),
                        radius: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Mahmoud Ragab",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.blueGrey,
                                        blurRadius: 1.5,
                                      ),
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .013,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.blue,
                                        Colors.blueAccent,
                                      ],
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            "1554 ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Followers",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .03,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.blueAccent,
                                        Colors.blue,
                                      ],
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            "2454 ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Followers",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "My Points : 50",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Constants.darkGrayBG,
                                        Constants.darkGrayBG,
                                      ],
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * .22,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Flexible(
              fit: FlexFit.tight,
              flex: 9,
              child: Container(
                color: Color(0xff063238),
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return InkWell(
                      onTap: () {
                        prefix0.Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          drawerItems[position].screenToGo,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListTile(
                          title: Text(
                            drawerItems[position].titleItem,
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          trailing: Icon(
                            drawerItems[position].iconItem,
                            color: Constants.blue,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: drawerItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget _drawRowDrawerItem(BuildContext context) {
//    return Container(
//      constraints: BoxConstraints(
//          maxHeight: MediaQuery.of(context).size.height * 0.1,
//          maxWidth: MediaQuery.of(context).size.width),
//      child: Row(
//        children: <Widget>[
//          TextField(
//            decoration: InputDecoration(
//              suffixText: "",
//              prefixIcon: ,
//            ),
//          )
//        ],
//      ),
//    );
//  }
}
