import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

Widget fullAppbar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(170.0),
    child: GradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello Brenda!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              "Let's add new event for you",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/profile_image.jpg'),
                )),
          ),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Constants.darkGrayBG, Constants.whiteGrayBG],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.1,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
          decoration: BoxDecoration(
            color: CustomColors.HeaderGreyLight,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Create Events',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.22,
              ),
              InkWell(
                onTap: ()=>{},
                child: Container(
                  height:MediaQuery.of(context).size.height *0.05 ,
                    width: MediaQuery.of(context).size.width *0.2 ,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height *0.8,
                        maxWidth: MediaQuery.of(context).size.width *0.4),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff264138),Color(0xff263238),

                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.5,
                          spreadRadius: 1.5,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        " Permote! ",
                        style: TextStyle(
                          color: Constants.whiteBG,
                        ),
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80),
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget emptyAppbar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(75.0),
    child: GradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello Brenda!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'Today you have no tasks',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/photo.png'),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight],
      ),
    ),
  );
}

class CircleOne extends CustomPainter {
  Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
