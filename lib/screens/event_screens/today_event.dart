import 'package:evntown/screens/event_screens/trending_event_item.dart';
import 'package:evntown/screens/utilities_screen/drawer__screen.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';

class TodayEventScreen extends StatefulWidget {
  @override
  _TodayEventScreenState createState() => _TodayEventScreenState();
}

class _TodayEventScreenState extends State<TodayEventScreen> {
  List<Event> events;
  PageController _todayController;

  @override
  void initState() {
    super.initState();
    events = getEvent();
    _todayController = PageController(initialPage: 1,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Today Events "),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: DrawerScreen(),
      body: PageView.builder(
        controller: _todayController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20,),
            child: TrendingItem(
              width: 0.8,
              height: 4.5,
              isPermote: false,
              imageHeight: 2,
              img: events[index].image,
              title: events[index].title,
              address: events[index].location,
              itemType: events[index].type,
              date: events[index].date,
              titleSize: 26,
              itemTypeSize:24 ,
              addressSize: 20,
              dateSize: 18,
            ),
          );
        },
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
