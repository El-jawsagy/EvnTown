import 'dart:async';
import 'dart:io';

import 'package:evntown/screens/all_home_screens/home_screen_new.dart';
import 'package:evntown/screens/timeline_screens/timeline_screen.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_profile_screens/profile_Screen.dart';
import 'notification_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  Timer timer;
  setScreenLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('screenHome', true);
    await prefs.setBool('screenLoging', false);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
    setScreenLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          HomeScreenNew(),
          TimeLineScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color:
                  _page == 0 ? Theme.of(context).accentColor : Colors.white70,
              onPressed: () => _pageController.jumpToPage(0),
            ),
            IconButton(
              icon: Icon(
                Icons.label,
                size: 24.0,
              ),
              color:
                  _page == 1 ? Theme.of(context).accentColor : Colors.white70,
              onPressed: () => _pageController.jumpToPage(1),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                size: 24.0,
                color: Theme.of(context).primaryColor,
              ),
              color: Theme.of(context).textTheme.caption.color,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24.0,
              ),
              color:
                  _page == 2 ? Theme.of(context).accentColor : Colors.white70,
              onPressed: () => _pageController.jumpToPage(2),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color:
                  _page == 3 ? Theme.of(context).accentColor : Colors.white70,
              onPressed: () => _pageController.jumpToPage(3),
            ),
            SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => mainBottomSheet(context),
      ),
    );
  }

  void mainBottomSheet(BuildContext context) {
    File _image;
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _DrawButtonSheet();
      },
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}


class _DrawButtonSheet extends StatefulWidget {
  @override
  _DrawButtonSheetState createState() => _DrawButtonSheetState();

}

class _DrawButtonSheetState extends State<_DrawButtonSheet> {


  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height / 25,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(175, 30),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 340,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/fab-delete.png'),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            CustomColors.PurpleLight,
                            CustomColors.PurpleDark,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.PurpleShadow,
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Add Post',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          initialValue: 'Description ',
                          autofocus: true,
                          style: TextStyle(
                              fontSize: 22, fontStyle: FontStyle.normal),
                          decoration:
                          InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight:
                          MediaQuery.of(context).size.height * 0.2,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () => getImage(),
                              child: Text(
                                "select image",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      (_image == null)
                          ? Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height:
                        MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "swip up after load image ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                          : Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height:
                        MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                          // Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 60,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                CustomColors.BlueLight,
                                CustomColors.BlueDark,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.BlueShadow,
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          padding:
                          const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Center(
                            child: const Text(
                              'Add post',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
