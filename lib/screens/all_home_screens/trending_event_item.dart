import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String itemType;
  IconData icon = Icons.star_border;
  double titleSize = 20;
  double itemTypeSize = 17;
  double addressSize = 12;
  double dateSize = 14;
  String date;
  Color color = Constants.lightGray;
  bool isPermote = false;
  final double width;
  final double height;
  final double imageHeight;

  TrendingItem(
      {Key key,
      @required this.img,
      @required this.title,
      @required this.address,
      @required this.itemType,
      this.icon,
      this.date,
      this.isPermote,
      this.titleSize,
      this.itemTypeSize,
      this.addressSize,
      this.dateSize,
      this.color,
      @required this.width,
      @required this.height,
      @required this.imageHeight})
      : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / widget.height,
        width: MediaQuery.of(context).size.width * widget.width,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height /
                        (widget.imageHeight),
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        "${widget.img}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          widget.icon,
                          color: widget.color,
                        )),
                  ),
                  (widget.isPermote)
                      ? Positioned(
                          top: 6.0,
                          left: 6.0,
                          child: Card(
                            margin: EdgeInsets.all(12),
                            color: Colors.blueAccent,
                            child: Text(
                              " Permote ",
                              style: TextStyle(
                                  color: Constants.whiteBG, fontSize: 12),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontSize: widget.titleSize,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.itemType}",
                    style: TextStyle(
                      fontSize: widget.itemTypeSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.address}",
                    style: TextStyle(
                      fontSize: widget.addressSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              (widget.date == null)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 6),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "${widget.date}",
                            style: TextStyle(
                              fontSize: widget.dateSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
