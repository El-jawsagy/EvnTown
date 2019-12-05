import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget giveSpace(double about, BuildContext context, {bool vertical = false}) {
  if (!vertical) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * about,
    );
  }
  return SizedBox(
    width: MediaQuery.of(context).size.width * about,
  );
}

class Page {
  IconData iconData;
  String header, description;

  Page(this.iconData, this.header, this.description);
}

class Feature {
  String title;
  String description;
  IconData iconData;
  Color backgroundColor;

  Feature({this.title, this.iconData, this.backgroundColor, this.description});
}

List<Feature> featuresIcons() {
  List<Feature> features = [];
  features.add(Feature(
    title: "Your event will be in the top of the app for 5 days",
    iconData: FontAwesomeIcons.thumbtack,
    backgroundColor: Constants.darkGrayBG,
  ));
  features.add(
    Feature(
      title:
          "Real time analysis track your event campaign, Visits, Reports And more",
      iconData: FontAwesomeIcons.chartLine,
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(Feature(
    title:
        "Suggest freelance worker for you to work in your event like Photographer, Video editor And more to help you in your event",
    iconData: FontAwesomeIcons.prayingHands,
    backgroundColor: Constants.darkGrayBG,
  ));
  features.add(
    Feature(
      title:
          "Promote your events on our social media like Facebook, Twitter to reach target audience",
      iconData: FontAwesomeIcons.ad,
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  return features;
}

List<Feature> featuresString() {
  List<Feature> features = [];
  features.add(
    Feature(
      title: "About Us",
      description:
          "We act as a link between events regulators and people interested to help"
          " facilitate this process for both parties Your Favourite Events All In One Place,"
          " You Can See Any Events All Over The Month You Dont Miss Any Even",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "PRIVACY POLICY",
      description:
          "The term 'EVNTOWN' or 'us' or 'we' refers to the owner of the application."
          "The term 'you' refers to the user or viewer of our application."
          "When you use EVNTOWN, you allow EVNTOWN to access certain information  "
          "from your profile for that App.",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "For example ",
      description:
          "For example 'EVNTOWN' may access and store some or all of the following information, "
          "as allowed by you and your preferences(selected while allowing access) "
          "Your first and last name Your profile picture and/or its URL Your user"
          " ID number, which is linked to publicly available information such as name "
          "and profile photo The user ID numbers and other public data for your friends "
          "The login e-mail you provided to that social networking site when you "
          "registered Full Disclosure",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "Event",
      description:
          " The event and related information is community generated content on Facebook."
          " EVNTOWN accesses only the public events from Facebook users and user's friends "
          "who use our application. Its users' responsibility to select PRIVATE option while"
          " creating events on Facebook if they don't want to list their events as public."
          " This website uses cookies to monitor browsing preferences",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "Instructions",
      description: "Neither we nor any third parties provide any warranty or guarantee as to the"
              " accuracy, timeliness, performance, completeness or suitability of the information"
              " and materials found or offered on this application for any particular purpose. "
              "You acknowledge that such information and materials may contain inaccuracies or "
              "errors and we expressly exclude liability for any such inaccuracies or errors to the"
              " fullest extent permitted by law. Your use of any information or materials on this " +
          "-->",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "Another Instructions",
      description: "application is entirely at your own risk, for which we shall not be liable. It shall"
              " be your own responsibility to ensure that any products, services or information"
              " available through this website meet your specific requirements. This application "
              "contains material which is owned by or licensed to us. This material includes, but "
              "is not limited to, the design, layout, look, appearance and graphics. Reproduction"
              " is prohibited other than in accordance with the copyright notice, which forms part " +
          "-->",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  features.add(
    Feature(
      title: "Another Instructions",
      description:
          "of these terms and conditions If anyone has any issue (obligation, privacy related, legal, "
          "criminal, political, identity theft or any other) with the content of event, we request them to "
          "directly contact to the Facebook for the problem and/or removal of events. EVNTOWN is not affiliated "
          "with Facebook and only displays the information which is publicly available. Crawling or scraping content "
          "posted to EVNTOWN is strictly not allowed and strong action shall be taken against such activities",
      backgroundColor: Constants.darkGrayBG,
    ),
  );
  return features;
}

class Choice {
  const Choice({
    this.title,
    this.icon,
    this.color,
  });

  final String title;
  final IconData icon;
  final Color color;
}

List<Choice> categoryIcons() {
  return <Choice>[
    const Choice(
      title: 'Business',
      icon: FontAwesomeIcons.briefcase,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Concerts',
      icon: FontAwesomeIcons.guitar,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Perfomances',
      icon: FontAwesomeIcons.bullhorn,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Sports',
      icon: FontAwesomeIcons.biking,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'WorkShpos',
      icon: FontAwesomeIcons.handshake,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Entertainment',
      icon: FontAwesomeIcons.angellist,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Fashion',
      icon: FontAwesomeIcons.mask,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Art',
      icon: FontAwesomeIcons.palette,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Theatre',
      icon: FontAwesomeIcons.theaterMasks,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Comedy',
      icon: FontAwesomeIcons.laughBeam,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Conferences',
      icon: FontAwesomeIcons.school,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Health & Wellness',
      icon: FontAwesomeIcons.heartbeat,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Food & Drinks',
      icon: FontAwesomeIcons.utensils,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Trips & Adventures',
      icon: FontAwesomeIcons.plane,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Crafts',
      icon: FontAwesomeIcons.pencilRuler,
      color: Color(0xff0d3f67),
    ),
    const Choice(
      title: 'Photography',
      icon: FontAwesomeIcons.cameraRetro,
      color: Color(0xff0d3f67),
    ),
  ];
}

class Category {
  String name;
  bool val;

  Category(this.name, this.val);
}

List<Category> getCategories() {
  List<Category> Categories = [];
  Categories.add(Category(
    "Business",
    false,
  ));
  Categories.add(Category(
    "Concerts",
    false,
  ));
  Categories.add(Category("Trip_Adventures", false));
  Categories.add(Category("Health & Wellness", false));
  Categories.add(Category("Workshop", false));
  Categories.add(Category("Entertainment", false));
  Categories.add(Category("Sports", false));
  Categories.add(Category("Art", false));
  Categories.add(Category("Treatre", false));
  Categories.add(Category("Crafts", false));
  Categories.add(Category("Food & Drink", false));
  Categories.add(Category("Congrtrnces", false));
  Categories.add(Category("Comedy", false));
  Categories.add(Category("photography", false));
  return Categories;
}

//class to create alertDialog to select events Types

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
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
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
