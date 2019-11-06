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
  IconData iconData;
  Color backgroundColor;

  Feature(this.title, this.iconData, this.backgroundColor);
}

List<Feature> featuresIcons() {
  List<Feature> features = [];
  features.add(Feature(
    "Your event will be in the top of the app for 5 days",
    FontAwesomeIcons.thumbtack,
    Color(0xff004d61),
  ));
  features.add(Feature(
    "Real time analysis track your event campaign, Visits, Reports And more",
    FontAwesomeIcons.chartLine,
    Color(0xff004d61),
  ));
  features.add(Feature(
    "Suggest freelance worker for you to work in your event like Photographer, Video editor And more to help you in your event",
    FontAwesomeIcons.prayingHands,
    Color(0xff004d61),
  ));
  features.add(Feature(
    "Promote your events on our social media like Facebook, Twitter to reach target audience",
    FontAwesomeIcons.ad,
    Color(0xff004d61),
  ));
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



