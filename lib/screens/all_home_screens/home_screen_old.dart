//import 'dart:async';
//
//import 'package:dots_indicator/dots_indicator.dart';
//import 'package:evntown/utilities/models_classes_methodes.dart';
//import 'package:evntown/utilities/multi_screen_android.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//  int trendingPagePos = 5;
//  int trendingIndicatorPos = 2;
//
//  int featurePos = 1;
//  PageController _trendingController;
//
//  PageController _featuresController;
//
//  Timer _timer;
//
//  List<Choice> _allCategories = [];
//  List<Feature> _featuresIcons = [];
//
//  @override
//  void initState() {
//    _trendingController = PageController(initialPage: 5, keepPage: false);
//    _featuresController =
//        PageController(initialPage: 1, keepPage: false, viewportFraction: 0.8);
//    _allCategories = categoryIcons();
//    _featuresIcons = featuresIcons();
//    startTimerTrending();
//    startTimerFeatures();
//    super.initState();
//  }
//
//  void startTimerTrending() {
//    const oneSec = const Duration(seconds: 5);
//    _timer = new Timer.periodic(
//      oneSec,
//      (Timer timer) => setState(
//        () {
//          if (trendingPagePos < 9) {
//            _trendingController.jumpToPage(trendingPagePos + 1);
//          } else {
//            trendingPagePos = 0;
//            _trendingController.jumpToPage(trendingPagePos);
//          }
//        },
//      ),
//    );
//  }
//
//  void startTimerFeatures() {
//    const oneSec = const Duration(seconds: 5);
//    _timer = new Timer.periodic(
//      oneSec,
//      (Timer timer) => setState(
//        () {
//          if (featurePos < 3) {
//            _featuresController.jumpToPage(featurePos + 1);
//          } else {
//            featurePos = 0;
//            _featuresController.jumpToPage(featurePos);
//          }
//        },
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    DetectedScreen detectedScreen = DetectedScreen(context);
//    LoginScreenProperties(detectedScreen);
//
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Row(
//          children: <Widget>[
//            IconButton(
//              icon: Icon(FontAwesomeIcons.search),
//              onPressed: () {},
//            ),
//          ],
//        ),
//        centerTitle: false,
//        backgroundColor: Color(0xff263238),
//        actions: <Widget>[
//          IconButton(
//            onPressed: () {},
//            icon: Icon(FontAwesomeIcons.plusCircle),
//          ),
//          IconButton(
//            onPressed: () {},
//            icon: Icon(FontAwesomeIcons.map),
//          )
//        ],
//      ),
//      drawer: Drawer(
//        child: Center(child: Text("Let's do it")),
//      ),
//      body: _drawBodyOfScaffold(),
//      bottomNavigationBar: _drawNavBar(),
//    );
//  }
//
//  Widget _drawBodyOfScaffold() {
//    return SingleChildScrollView(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          _drawTitleTrendingEvent(),
//          giveSpace(0.009, context),
//          _drawTrendingEvent(),
//          _drawTitleTodayEvent(),
//          giveSpace(0.009, context),
//          _drawTodayEvent(),
//          giveSpace(0.009, context),
//          _drawTitleCategory(),
//          giveSpace(0.007, context),
//          _drawCategoryGrid(_allCategories),
//          _drawTitleFeatures(),
//          _drawFeatures(_featuresIcons),
//        ],
//      ),
//    );
//  }
//
//  Widget _drawTitleTrendingEvent() {
//    return Padding(
//      padding: const EdgeInsets.only(
//        left: 12.0,
//        right: 12,
//        top: 16,
//        bottom: 8,
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text(
//            "Trending Events :",
//            style: TextStyle(
//                color: Color(0xff263238),
//                fontSize: 14,
//                fontWeight: FontWeight.bold),
//          ),
//          InkWell(
//            onTap: () {},
//            child: Row(
//              children: <Widget>[
//                Text(
//                  "See All",
//                  style: TextStyle(
//                      color: Colors.blue,
//                      fontSize: 14,
//                      fontWeight: FontWeight.bold),
//                ),
//                Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.blue,
//                  size: 14,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _drawTrendingEvent() {
//    return Container(
//      height: MediaQuery.of(context).size.height * .25,
//      child: Stack(
//        children: [
//          PageView.builder(
//            controller: _trendingController,
//            itemCount: 10,
//            itemBuilder: (context, position) {
//              return _drawTrendingSinglePage(position);
//            },
//            onPageChanged: (value) {
//              setState(() {
//                trendingPagePos = value;
//                if (trendingPagePos <= 4 && trendingPagePos >= 9) {
//                  trendingIndicatorPos = trendingPagePos;
//                } else if (trendingPagePos > 4 && trendingPagePos < 9) {
//                  switch (trendingPagePos) {
//                    case 5:
//                      trendingIndicatorPos = trendingPagePos - 1;
//                      break;
//                    case 6:
//                      trendingIndicatorPos = trendingPagePos - 2;
//                      break;
//                    case 7:
//                      trendingIndicatorPos = trendingPagePos - 3;
//                      break;
//                    case 8:
//                      trendingIndicatorPos = trendingPagePos - 4;
//                      break;
//                  }
//                } else {
//                  trendingIndicatorPos = trendingPagePos;
//                }
//              });
//            },
//            scrollDirection: Axis.horizontal,
//          ),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: Row(
//              children: <Widget>[
//                Icon(Icons.play_arrow),
//                DotsIndicator(
//                  dotsCount: 5,
//                  position: trendingIndicatorPos,
//                  decorator: DotsDecorator(
//                    color: Colors.white,
//                    activeColor: Colors.blue,
//                    size: Size(7, 7),
//                  ),
//                ),
//                Icon(Icons.play_arrow),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _drawTrendingSinglePage(int index) {
//    return Stack(children: <Widget>[
//      ShaderMask(
//        shaderCallback: (Rect bounds) {
//          return LinearGradient(
//              colors: [Colors.black45, Colors.black45],
//              stops: [0.0, 0.5]).createShader(bounds);
//        },
//        blendMode: BlendMode.srcATop,
//        child: Container(
//          margin: EdgeInsets.only(left: 10, right: 10),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(7),
//            image: DecorationImage(
//                image: ExactAssetImage("assets/images/event_background.jpg"),
//                fit: BoxFit.cover),
//          ),
//        ),
//      ),
//      Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              child: Text(
//                "Event Name ",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                  fontSize: 18,
//                  fontWeight: FontWeight.w600,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(4.0),
//              child: Container(
//                child: Text(
//                  "Event Type ",
//                  style: TextStyle(
//                    fontSize: 15,
//                    color: Colors.white,
//                  ),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//            ),
//            giveSpace(0.01, context),
//            Container(
//              width: MediaQuery.of(context).size.width * .8,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text(
//                    "zagazig ,el sharqia",
//                    style: TextStyle(
//                      fontSize: 16,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Icon(
//                    Icons.map,
//                    color: Colors.white70,
//                  )
//                ],
//              ),
//            ),
//            giveSpace(0.008, context),
//            Container(
//              width: MediaQuery.of(context).size.width * 0.615,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text(
//                    "Published from day one",
//                    style: TextStyle(
//                      fontSize: 16,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Icon(
//                    Icons.timer,
//                    color: Colors.white70,
//                  )
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    ]);
//  }
//
//  Widget _drawTitleTodayEvent() {
//    return Padding(
//      padding: const EdgeInsets.only(
//        left: 12.0,
//        right: 12,
//        top: 14,
//        bottom: 4,
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text(
//            "Today Event :",
//            style: TextStyle(
//                color: Color(0xff263238),
//                fontSize: 14,
//                fontWeight: FontWeight.bold),
//          ),
//          InkWell(
//            onTap: () {},
//            child: Row(
//              children: <Widget>[
//                Text(
//                  "See All",
//                  style: TextStyle(
//                      color: Colors.blue,
//                      fontSize: 14,
//                      fontWeight: FontWeight.bold),
//                ),
//                Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.blue,
//                  size: 14,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _drawTodayEvent() {
//    return Container(
//      height: MediaQuery.of(context).size.height * .25,
//      child: GridView.builder(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 1,
//          mainAxisSpacing: 1,
//          childAspectRatio: 1.05,
//        ),
//        itemBuilder: (context, position) {
//          return Stack(
//            overflow: Overflow.visible,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: ShaderMask(
//                  shaderCallback: (Rect bounds) {
//                    return LinearGradient(
//                        colors: [Colors.black38, Colors.black38],
//                        stops: [0.0, 0.5]).createShader(bounds);
//                  },
//                  blendMode: BlendMode.srcATop,
//                  child: Container(
//                    width: MediaQuery.of(context).size.width * .37,
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: ExactAssetImage(
//                              "assets/images/event_background.jpg"),
//                          fit: BoxFit.cover),
//                      borderRadius: BorderRadius.circular(15),
//                    ),
//                  ),
//                ),
//              ),
//              Center(
//                widthFactor: 1.75,
//                child: SizedBox(
//                  child: Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          "Cairokee",
//                          style: TextStyle(
//                              fontSize: 18,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white),
//                        ),
//                        giveSpace(.004, context),
//                        Center(
//                          widthFactor: 2.2,
//                          child: Text(
//                            'Music',
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          );
//        },
//        itemCount: 10,
//        scrollDirection: Axis.horizontal,
//      ),
//    );
//  }
//
//  Widget _drawTitleCategory() {
//    return Padding(
//      padding: const EdgeInsets.only(
//        left: 12.0,
//        right: 12,
//        top: 4,
//        bottom: 4,
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text(
//            "Category :",
//            style: TextStyle(
//                color: Color(0xff263238),
//                fontSize: 14,
//                fontWeight: FontWeight.bold),
//          ),
//          InkWell(
//            onTap: () {},
//            child: Row(
//              children: <Widget>[
//                Text(
//                  "See All",
//                  style: TextStyle(
//                      color: Colors.blue,
//                      fontSize: 14,
//                      fontWeight: FontWeight.bold),
//                ),
//                Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.blue,
//                  size: 14,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _drawCategoryGrid(List<Choice> choices) {
//    return Container(
//      constraints: BoxConstraints(
//          maxWidth: MediaQuery.of(context).size.width,
//          maxHeight: MediaQuery.of(context).size.height * .2),
//      child: GridView.count(
//        crossAxisCount: 1,
//        children: List.generate(
//          choices.length,
//          (index) {
//            return _drawCardCategory(choices[index]);
//          },
//        ),
//        scrollDirection: Axis.horizontal,
//      ),
//    );
//  }
//
//  Widget _drawCardCategory(Choice choice) {
//    return Center(
//      child: InkWell(
//        onTap: () {},
//        child: Container(
//          width: MediaQuery.of(context).size.width * 0.33,
//          height: MediaQuery.of(context).size.height * .17,
//          child: Card(
//            color: choice.color,
//            elevation: 8,
//            child: Column(
//                mainAxisSize: MainAxisSize.min,
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Icon(choice.icon, size: 40.0, color: Colors.white),
//                  giveSpace(0.01, context),
//                  Text(
//                    choice.title,
//                    style: TextStyle(color: Colors.white),
//                    textAlign: TextAlign.center,
//                  ),
//                ]),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _drawTitleFeatures() {
//    return Padding(
//      padding: const EdgeInsets.only(
//        top: 16.0,
//        bottom: 8,
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Text(
//            "are you event organizer ?",
//            style: TextStyle(
//              fontSize: 17,
//              color: Color(0xff263238),
//              fontWeight: FontWeight.bold,
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _drawFeatures(List<Feature> feat) {
//    return Container(
//      height: MediaQuery.of(context).size.height * .5,
//      width: MediaQuery.of(context).size.width,
//      child: Stack(children: <Widget>[
//        PageView.builder(
//          itemBuilder: (context, position) {
//            return Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(7),
//                  color: feat[position].backgroundColor,
//                ),
//                constraints: BoxConstraints(
//                    maxHeight: MediaQuery.of(context).size.height * .5),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Icon(
//                      feat[position].iconData,
//                      size: 50,
//                      color: Colors.white,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(16.0),
//                      child: Text(
//                        feat[position].title,
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 18, color: Colors.white),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            );
//          },
//          itemCount: 4,
//          controller: _featuresController,
//          onPageChanged: (position) {
//            setState(() {
//              featurePos = position;
//            });
//          },
//        ),
//        Transform.translate(
//          offset: Offset(0, -15),
//          child: Align(
//            alignment: Alignment.bottomCenter,
//            child: DotsIndicator(
//              dotsCount: feat.length,
//              position: featurePos,
//              decorator: DotsDecorator(
//                color: Colors.white,
//                activeColor: Colors.blue,
//                size: Size(7, 7),
//              ),
//            ),
//          ),
//        )
//      ]),
//    );
//  }
//
//  Widget _drawNavBar() {
//    List<IconData> _icons = [
//      FontAwesomeIcons.globeAmericas,
//      FontAwesomeIcons.home,
//      FontAwesomeIcons.gift,
//      FontAwesomeIcons.bell,
//      FontAwesomeIcons.userCircle,
//    ];
//    return Container(
//      constraints: BoxConstraints(
//        maxHeight: MediaQuery.of(context).size.height * 0.08,
//        maxWidth: MediaQuery.of(context).size.width,
//      ),
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height * 0.07,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.only(
//          topLeft: Radius.circular(7),
//          topRight: Radius.circular(7),
//        ),
//        boxShadow: [
//          new BoxShadow(
//            color: Colors.grey,
//            blurRadius: 10.0,
//          ),
//        ],
//        color: Color(0xff263238),
//      ),
//      child: ListView.builder(
//        itemBuilder: (context, position) {
//          return _drawIconButton(_icons[position], position);
//        },
//        primary: true,
//        itemCount: 5,
//        scrollDirection: Axis.horizontal,
//      ),
//    );
//  }
//
//  Widget _drawIconButton(IconData iconData, int pos) {
//    return Container(
//      margin: EdgeInsets.only(left: 9, right: 9),
//      width: MediaQuery.of(context).size.width * .15,
//      height: MediaQuery.of(context).size.height * .6,
//      child: IconButton(
//          icon: Icon(
//            iconData,
//            size: MediaQuery.of(context).size.width * 0.09,
//            color: Color(0xff929e9e),
//          ),
//          onPressed: () {}),
//    );
//  }
//
//  @override
//  // ignore: must_call_super
//  void dispose() {
//    _trendingController.dispose();
//    _featuresController.dispose();
//    _timer.cancel();
//    _featuresIcons.clear();
//    _allCategories.clear();
//  }
//}
