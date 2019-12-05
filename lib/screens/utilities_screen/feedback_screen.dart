import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _feedBackCcontroller;

  @override
  void initState() {
    _feedBackCcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //todo:built feedback Screen
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("FeedBack"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "What can we help you with?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                _drawFeedBackTaker(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                _drawAddFeedBackButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                Text(
                  "Q & A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                _drawQuestionRow(),
              ],
            ),
          ],
        ));
  }

  Widget _drawFeedBackTaker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _feedBackCcontroller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          letterSpacing: 1.1,
          height: 1.5,
        ),
        decoration: InputDecoration(
            hintText: "Give us your question?",
            fillColor: Constants.whiteBG,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        maxLines: 9,
      ),
    );
  }

  Widget _drawAddFeedBackButton() {
    return InkWell(
      onTap: () {
        prefix0.Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: LinearGradient(
              colors: [
                Constants.whiteGrayBG,
                Constants.whiteGrayBG,
              ],
            ),
            boxShadow: [BoxShadow(color: Constants.gray, spreadRadius: 1.5)]),
        child: Center(
          child: Text(
            "send you opinion to us",
            style: TextStyle(
              color: Constants.whiteBG,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawQuestionRow() {
    return Container(
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            maxHeight: MediaQuery.of(context).size.height * 0.7),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "What is EvnTown ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .8,
                      maxHeight: MediaQuery.of(context).size.height * 0.2),
                  child: Text(
                    "- You can enter about us from menu and read everything about us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "how does Evntown promote?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .8,
                      maxHeight: MediaQuery.of(context).size.height * 0.2),
                  child: Text(
                    "- You can enter about us from menu and read everything about how you can promote your eveny",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedBackCcontroller.dispose();
    super.dispose();
  }
}
