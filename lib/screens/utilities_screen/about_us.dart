import 'package:dots_indicator/dots_indicator.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  PageController _aboutUsFeaturesController;

  int aboutUsFeaturesPos = 1;

  List<Feature> _aboutUsFeatures = [];

  @override
  void initState() {
    super.initState();
    _aboutUsFeaturesController = PageController(
        initialPage: aboutUsFeaturesPos,
        keepPage: false,
        viewportFraction: 0.9);
    _aboutUsFeatures = featuresString();
  }

  @override
  Widget build(BuildContext context) {
//todo:built About Us Screen

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _drawFeatures(_aboutUsFeatures),
            ),
            _drawButtonsRow(),
          ],
        ),
      ),
    );
  }

  Widget _drawFeatures(List<Feature> feat) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
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
                    (position == 0)
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                feat[position].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                        : ((position == 1)
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    feat[position].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )
                            : Container()),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text(
                              feat[position].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                                letterSpacing: 1.2,
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: feat.length,
          controller: _aboutUsFeaturesController,
          onPageChanged: (position) {
            setState(() {
              aboutUsFeaturesPos = position;
            });
          },
        ),
        Transform.translate(
          offset: Offset(0, -15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: feat.length,
              position: aboutUsFeaturesPos,
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

  Widget _drawButtonsRow() {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .8,
            maxHeight: MediaQuery.of(context).size.height * .08,
          ),
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Constants.whiteGrayBG,
                width: MediaQuery.of(context).size.width * 0.34,
                height: MediaQuery.of(context).size.height * 0.065,
                child: Center(
                  child: Text(
                    "Rate this App",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Constants.whiteGrayBG,
                width: MediaQuery.of(context).size.width * 0.34,
                height: MediaQuery.of(context).size.height * 0.065,
                child: Center(
                  child: Text(
                    "FeedBack",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
