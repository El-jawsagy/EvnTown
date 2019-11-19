import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            "Notifications",
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "people",
              ),
              Tab(
                text: "Event",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _drawNotificationPeople(),
            _drawNotificationEvent(),
          ],
        ),
      ),
    );
  }

  Widget _drawNotificationPeople() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: notificationsPeople.length,
      itemBuilder: (BuildContext context, int index) {
        Map notificationPeople = notificationsPeople[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                notificationPeople['dp'],
              ),
              radius: 25,
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              notificationPeople['notif'],
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              notificationPeople['time'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _drawNotificationEvent() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: notificationsEvent.length,
      itemBuilder: (BuildContext context, int index) {
        Map notificationsEvents = notificationsEvent[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                notificationsEvents['dp'],
              ),
              radius: 25,
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              notificationsEvents['notif'],
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              notificationsEvents['time'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
