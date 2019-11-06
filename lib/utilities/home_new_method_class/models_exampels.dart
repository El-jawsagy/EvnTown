import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//List friends = [
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//  "assets/images/event_background.jpg",
//];
List friends = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/images/event_background.jpg",
  "status": "Anything could be here",
  "isAccept": random.nextBool(),
});
class Event {
  String image;
  String title;
  String location;
  String type;
  String date;

  Event(
    this.image,
    this.title,
    this.type,
    this.location,
    this.date,
  );
}

List<Event> getEvent() {
  List<Event> events = [];
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  events.add(Event("assets/images/event_background.jpg", "Cairokee", "music",
      "12 Zagazig City, El sarqia, Egypt", "12 oct 2020"));
  return events;
}

List categories = [
  {
    "name": "Business",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/business.jpg"
  },
  {
    "name": "Concerts",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/concerts.jpg"
  },
  {
    "name": "Trip & Adventures",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/trip_adventures.jpg"
  },
  {
    "name": "Health & Wellness",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/health_wellness.jpg"
  },
  {
    "name": "Workshops",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/workshops.jpg"
  },
  {
    "name": "Entertainment",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/entertainment.jpg"
  },
  {
    "name": "Sports",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/sports.jpg"
  },
  {
    "name": "Art",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/art.jpg"
  },
  {
    "name": "Theatre",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/theatre.jpg"
  },
  {
    "name": "Crafts",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/crafts.jpg"
  },
  {
    "name": "Food & Drink",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/food_drink.jpg"
  },
  {
    "name": "Conferences",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/conferences.jpg"
  },
  {
    "name": "Comedy",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/comedy.jpg"
  },
  {
    "name": "Photography",
    "color1": Color.fromARGB(100, 0, 0, 0),
    "color2": Color.fromARGB(100, 0, 0, 0),
    "img": "assets/images/photography.jpg"
  },
];

Random random = Random();

List names = [
  "mahmoud el jawsagy",
  "mohanad",
  "mohamad fat7y",
  "Ana w Anta",
  "Anta w homa",
  "mahmoud el jawsagy tany",
  "mohand tany brdo ",
  "mohamed la ",
  "mahmoud el jawsagy",
  "mohand tany brdo ",
  "mohamed la ",
  "mahmoud el jawsagy",
  "mohamed la ",
];


List events = [
  'cairokee',
  'hossam hekal',
  'hazem elsadeek',
  'flutter workShop',
  'Tedx zag',
  'Ebrahim el 5oly',
  'cairokee 1',
  'hossam hekal 1',
  'hazem elsadeek 1',
  'flutter workShop 1',
  'Tedx zag 1',
  'Ebrahim el 5oly 1',
  'bladyt El ma7ala'
];



List posts = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/profile_image.jpg",
          "time": "${random.nextInt(50)} min ago",
          "img": "assets/images/theatre.jpg"
        });

List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

List notificationsPeople = List.generate(
    13,
    (index) => {
          "name": events[random.nextInt(13)],
          "dp": "assets/images/profile_image.jpg",
          "time": "${random.nextInt(50)} min ago",
          "notif": notifs[random.nextInt(10)]
        });

List notificationsEvent = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/profile_image.jpg",
          "time": "${random.nextInt(50)} min ago",
          "notif": notifs[random.nextInt(10)]
        });



class DrawerItem{
  String titleItem;
  IconData iconItem;
  String screenToGo;

  DrawerItem(this.titleItem, this.iconItem, this.screenToGo);

}


List<DrawerItem> getItem(){
  List<DrawerItem> items=[];
  items.add(DrawerItem("Create Event", Icons.create, '/addEvent'),);
  items.add(DrawerItem("Events History", Icons.history, '/eventHistory'),);
  items.add(DrawerItem("Interest Events", Icons.star_border, '/interestEvent'),);
  items.add(DrawerItem("Notifications", Icons.notifications, '/notification'),);
  items.add(DrawerItem("Find Friends", Icons.person_add, '/addFriends'),);
  items.add(DrawerItem("About Us", Icons.help, '/about'),);
  items.add(DrawerItem("Need Help", FontAwesomeIcons.handsHelping, '/help'),);
  items.add(DrawerItem("Feedback", Icons.feedback, '/feed'),);
  items.add(DrawerItem("Logout", FontAwesomeIcons.signOutAlt, '/logOut'),);

  return items;
}


