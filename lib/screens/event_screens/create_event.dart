import 'dart:io';

import 'package:evntown/screens/utilities_screen/app_bars.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../main_screen.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key key}) : super(key: key);

  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController _eventNameController;
  TextEditingController _eventDescriptionController;
  TextEditingController _eventLocationController;
  String _startdate = "Start data not set yet";
  String _enddate = "End data not set yet";
  DateTime date1;
  File _eventImage;
  List<Category> categories;

  @override
  void initState() {
    _eventNameController = TextEditingController();
    _eventDescriptionController = TextEditingController();
    _eventLocationController = TextEditingController();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              (_eventImage == null)
                  ? Container(
                      padding: EdgeInsets.all(10),
                    )
                  : Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Image.file(
                        _eventImage,
                        fit: BoxFit.cover,
                      ),
                    ),
              Row(
                children: <Widget>[
                  _drawEventName(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  _drawImageTaker(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              _drawEventDescription(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              _drawEventLocation(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _drawCategorySelect(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              _drawDataTicker(_startdate),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              _drawDataTicker(_enddate,start: false),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _drawOurRule(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _drawAddEventButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawEventName() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width * .73,
      ),
      child: TextField(
        controller: _eventNameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Event Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _eventImage = image;
    });
  }

  Widget _drawImageTaker() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: .75,
            spreadRadius: .75,
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(9),
        gradient: LinearGradient(colors: [
          Color(0xff264138),
          Color(0xff263238),
        ]),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width * .15,
      ),
      child: InkWell(
        onTap: () => getImage(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            FontAwesomeIcons.image,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _drawEventDescription() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: TextField(
        controller: _eventDescriptionController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Event Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }

  Widget _drawEventLocation() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: TextField(
        controller: _eventLocationController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "State, City, Street number, Street Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }

  Widget _drawCategorySelect() {
    return InkWell(
      onTap: () {
        setState(() {
          _drawCategoryTaker();
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width * .45,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: .75,
                spreadRadius: .75,
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.circular(9),
            gradient: LinearGradient(colors: [
              Color(0xff264138),
              Color(0xff263238),
            ]),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.07,
            maxWidth: MediaQuery.of(context).size.width * 0.45,
          ),
          child: Center(
              child: Text(
            "Select Category",
            style: TextStyle(color: Colors.white),
          ))),
    );
  }

  _drawCategoryTaker() {
    showDialog(
        context: context,
        builder: (context) {
          return DynamicDialog(
            categoryDialog: categories,
          );
        });
  }

  Widget _drawDataTicker(String title,{bool start = true}) {

    //todo: make user can't select end time lower than start time
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 4.0,
      onPressed: () {
        DatePicker.showDatePicker(context,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            minTime: DateTime.now(),
            maxTime: DateTime(DateTime.now().year +2, 12, 31), onConfirm: (date) {
          print('confirm $date');
          title = '${date.year} - ${date.month} - ${date.day}';
          setState(() {
             if(start){
               _startdate =title;
             }else{
               _enddate =title;
             }
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 18.0,
                        color: Color(0xff263238),
                      ),
                      Text(
                        " $title",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "  Change",
              style: TextStyle(
                  color: Color(0xff263238), fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ),
      ),
      color: Colors.white,
    );
  }

  //todo: add link event taker

  Widget _drawOurRule() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.07,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Note: We will add this event later after check it. thanks for Your patience ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
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
              Colors.indigo,
              Colors.blue,
              Colors.indigo,
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
        child: Center(
          child: const Text(
            'Add Event',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _eventLocationController.dispose();
    _eventImage.delete();
    _eventDescriptionController.dispose();
    _eventNameController.dispose();

    super.dispose();
  }
}

class DynamicDialog extends StatefulWidget {
  final List<Category> categoryDialog;

  DynamicDialog({this.categoryDialog});

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  List<Category> _categoryDialog;

  @override
  void initState() {
    _categoryDialog = widget.categoryDialog;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff263238),
      title: Text(
        'select category',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      content: ListView(
        children: <Widget>[
          _drawRowOfCategory(0, _categoryDialog),
          _drawRowOfCategory(1, _categoryDialog),
          _drawRowOfCategory(2, _categoryDialog),
          _drawRowOfCategory(3, _categoryDialog),
          _drawRowOfCategory(4, _categoryDialog),
          _drawRowOfCategory(5, _categoryDialog),
          _drawRowOfCategory(6, _categoryDialog),
          _drawRowOfCategory(7, _categoryDialog),
          _drawRowOfCategory(8, _categoryDialog),
          _drawRowOfCategory(9, _categoryDialog),
          _drawRowOfCategory(10, _categoryDialog),
          _drawRowOfCategory(11, _categoryDialog),
          _drawRowOfCategory(12, _categoryDialog),
          _drawRowOfCategory(13, _categoryDialog),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: Text('Done'),
            ),
          ],
        )
      ],
    );
  }

  _drawRowOfCategory(int pos, List<Category> categories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          categories[pos].name,
          style: TextStyle(color: Colors.white),
        ),
        Switch(
          value: categories[pos].val,
          onChanged: (value) {
            setState(() {
              categories[pos].val = value;
            });
          },
        )
      ],
    );
  }
}
