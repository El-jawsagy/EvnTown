import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String img;
  int commentNumber;

  String dropdownValue = 'One';

  PostItem({
    Key key,
    @required this.dp,
    @required this.name,
    @required this.time,
    @required this.img,
    this.commentNumber = 100,
  }) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

enum WhyFarther {
  harder,
  smarter,
  selfStarter,
}

class _PostItemState extends State<PostItem> {
  int total;

  @override
  void initState() {
    total = widget.commentNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        child: Container(
          constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height * 0.52),
          decoration: BoxDecoration(
            color: Color(0xffbbded6),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "${widget.dp}",
                    ),
                    radius: 18,
                  ),
                ),
                contentPadding: EdgeInsets.all(0.5),
                title: Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 102),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${widget.time}",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: PopupMenuButton<WhyFarther>(
                            onSelected: (WhyFarther result) {},
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<WhyFarther>>[
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.harder,
                                child: Text('Edit Post'),
                              ),
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.smarter,
                                child: Text('Copy Link Post'),
                              ),
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.selfStarter,
                                child: Text('Delet Post'),
                              ),
                            ],
                            onCanceled: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset(
                "${widget.img}",
                height: 180,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                child: Text(
                  "Description for test application with less than 100 characters Description for test application ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, left: 15, bottom: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.thumbsUp,
                            color: Colors.blueGrey.shade800,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.blueGrey.shade800,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.share,
                            color: Colors.blueGrey.shade800,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Text(
                              "View All Comments",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "(",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "$total",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Constants.blue),
                            ),
                            Text(
                              ")",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
