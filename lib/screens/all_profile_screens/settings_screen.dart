import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String title;

  List<Category> categories;

  TextEditingController userName;
  TextEditingController eventType;
  TextEditingController userBio;
  final _settingFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = "mahmoud ragab";
    userName = TextEditingController();
    eventType = TextEditingController();
    userBio = TextEditingController();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(letterSpacing: 1.2),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        children: <Widget>[
          Form(
            key: _settingFormKey,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      ExactAssetImage("assets/images/profile_image.jpg"),
                  radius: MediaQuery.of(context).size.height * 0.14,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                _drawUploadImageButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                _drawEditableNameField(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                _drawEditableFavoriteEvent(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                _drawCategorySelect(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                _drawEditableBio(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                _drawRowOfButtons()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawUploadImageButton() {
    return InkWell(
      onTap: () {
        //todo:link it with taker image and make it re set image in CircleAvatar
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
          color: Constants.blue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            "Update your Image",
            style: TextStyle(
                color: Constants.whiteBG, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _drawEditableNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        validator: (val) {
          if (val.isEmpty) {
            return "Note : No changes in your Name";
          }
          return null;
        },
        controller: userName,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants.whiteBG,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          //todo: make title in class to tke name of user and change it
          hintText: title,
          hintStyle: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _drawEditableFavoriteEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: eventType,
        textAlign: TextAlign.left,
        validator: (val) {
          if (val.isEmpty) {
            return "Note : No changes in your Favoite Event";
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants.whiteBG,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),

          //todo: make event in class to take favorite event of user and change it
          hintText: "Favorite Event:",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
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

  Widget _drawEditableBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: userBio,
        maxLines: 6,
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isEmpty) {
            return "Note: No changes in your bio";
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants.whiteBG,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          //todo: make bio in class to take bio of user and change it
          hintText: "Your Bio",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _drawRowOfButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: Constants.whiteGrayBG,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Constants.gray, spreadRadius: 1.5),
                  ]),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_settingFormKey.currentState.validate()) {
                //todo: save changes for account in firebase
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: Constants.whiteGrayBG,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Constants.gray, spreadRadius: 1.5),
                  ]),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userName.dispose();
    eventType.dispose();
    super.dispose();
  }
}
