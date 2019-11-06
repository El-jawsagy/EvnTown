import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    //todo:built feedback Screen
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          " Feedback Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
