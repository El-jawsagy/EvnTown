import 'package:evntown/screens/event_screens/trending_event_item.dart';
import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String time = "today";

  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    events = getEvent();
  }

  @override
  Widget build(BuildContext context) {
    final itemCountRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${events.length} Items",
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: _drawDataTicker(time),
        )
      ],
    );

    final list = Expanded(
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TrendingItem(
            width: 0.8,
            height: 2.5,
            isPermote: false,
            imageHeight: 4.5,
            img: events[index].image,
            title: events[index].title,
            address: events[index].location,
            itemType: events[index].type,
            date: events[index].date,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.55,
        ),
        itemCount: events.length,
      ),
    );

    return Container(
      child: Column(
        children: <Widget>[itemCountRow, list],
      ),
    );
  }

  Widget _drawDataTicker(String title, {bool start = true}) {
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
            maxTime: DateTime(DateTime.now().year + 1, 12, 31),
            onConfirm: (date) {
          print('confirm $date');
          title = '${date.year} - ${date.month} - ${date.day}';
          setState(() {
            time = title;
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}
