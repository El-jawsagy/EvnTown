import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';

class DisplayFriendsScreen extends StatefulWidget {
  @override
  _DisplayFriendsScreenState createState() => _DisplayFriendsScreenState();
}

class _DisplayFriendsScreenState extends State<DisplayFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search.. ',
            hintStyle: TextStyle(
              letterSpacing: 1.25,
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
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
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map friend = friends[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  friend['dp'],
                ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(
                friend['name'],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                friend['status'],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: friend['isAccept']
                  ? FlatButton(
                      child: Text(
                        "Unfollow",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.grey,
                      onPressed: () {},
                    )
                  : FlatButton(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                    ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
