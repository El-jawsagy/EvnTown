import 'package:evntown/screens/utilities_screen/app_bars.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';


class CreateEvent extends StatefulWidget {
  CreateEvent({Key key}) : super(key: key);

  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              //todo: complete built of create events in app

              child: TextField(),
            )
          ],
        ),
      ),

    );
  }
}
