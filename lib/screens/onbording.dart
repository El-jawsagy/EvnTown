import 'package:dots_indicator/dots_indicator.dart';
import 'package:evntown/screens/auth_screen/login_screen.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  bool last = false;
  int pagePos = 0;
  List<Page> onBordingPages = [
    Page(Icons.whatshot, "Welcome",
        "Now you cam explore all the events around you"),
    Page(Icons.videogame_asset, "Gamification",
        "Now you can collect several points and convert them into a ticket for any event of your choice for free"),
    Page(Icons.person_pin_circle, "Orgnaizer",
        "Now you can easily reach out to the right people for your event"),
    Page(Icons.group_add, "Be part of EVNTOWN", "Let's find you party"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263238),
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, position) {
              return _drawPage(position);
            },
            onPageChanged: (pos) {
              setState(() {
                pagePos = pos;
              });
            },
            itemCount: onBordingPages.length,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 20),
            child: Center(
              child: DotsIndicator(
                dotsCount: onBordingPages.length,
                position: pagePos,
                decorator: DotsDecorator(
                  color: Colors.white,
                  activeColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPage(int pos) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (pos == 0)
                    ? Container(
                        width: 200,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage('assets/images/logo.png'),
                              fit: BoxFit.cover),
                        ),
                      )
                    : Icon(
                        onBordingPages[pos].iconData,
                        size: 120,
                        color: Colors.white,
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    onBordingPages[pos].header,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    onBordingPages[pos].description,
                    style: TextStyle(
                        color: Color(0xff9e9e9e),
                        fontSize: 20,
                        letterSpacing: 1.1),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        (pos == onBordingPages.length - 1)
            ? Container(
                margin: EdgeInsets.only(bottom: 23, top: 23),
                width: MediaQuery.of(context).size.width * 70,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Transform.translate(
                          offset: Offset(0, 10),
                          child: Text(
                            "LOGIN",
                            textScaleFactor: 1.8,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/signUp");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Transform.translate(
                          offset: Offset(0, 10),
                          child: Text(
                            "SING UP",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.8,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: (pos == 0) ? 70 : (pos == 1) ? 25 : 45,
              )
      ],
    );
  }
}

