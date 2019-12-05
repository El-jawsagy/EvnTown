import 'package:dots_indicator/dots_indicator.dart';
import 'package:evntown/screens/main_screen.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/material.dart';

class OurFeatures extends StatefulWidget {
  @override
  _OurFeaturesState createState() => _OurFeaturesState();
}

class _OurFeaturesState extends State<OurFeatures> {
  PageController _featuresController;

  int featurePos = 1;

  bool isPromote;

  List<Feature> _featuresIcons = [];

  String buttonTitle;

  @override
  void initState() {
    super.initState();
    _featuresController = PageController(
        initialPage: featurePos, keepPage: false, viewportFraction: 0.8);
    _featuresIcons = featuresIcons();
    isPromote = false;
    buttonTitle = 'Add event without promote';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              _drawPromoteRow(),
              _drawFeatures(_featuresIcons),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(0, -20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _drawAddEventButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPromoteRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "For Promote your evet",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: isPromote,
            activeColor: Color(0xff006d61),
            onChanged: (val) {
              setState(() {
                isPromote = val;
                buttonTitle = (!isPromote)
                    ? 'Add event without promote'
                    : "Next For Promote";
              });
              print(isPromote);
            },
          )
        ],
      ),
    );
  }

  Widget _drawFeatures(List<Feature> feat) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          feat[position].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ),
                    ),
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
                activeColor: Constants.darkGrayBG,
                size: Size(7, 7),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _drawAddEventButton() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 60,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff264138),
              Color(0xff263238),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
