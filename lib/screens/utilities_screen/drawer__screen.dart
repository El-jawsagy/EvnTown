import 'package:evntown/utilities/home_new_method_class/models_exampels.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  List<DrawerItem> drawerItems = [];

  @override
  Widget build(BuildContext context) {
    drawerItems = getItem();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: DrawerHeader(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "EvnTown",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 7,
            child: ListView.builder(
              itemBuilder: (context, position) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, drawerItems[position].screenToGo);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListTile(
                      title: Text(
                        drawerItems[position].titleItem,
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(
                        drawerItems[position].iconItem,
                        color: Constants.blue,
                      ),
                    ),
                  ),
                );
              },
              itemCount: drawerItems.length,
            ),
          ),
        ],
      ),
    );
  }

//  Widget _drawRowDrawerItem(BuildContext context) {
//    return Container(
//      constraints: BoxConstraints(
//          maxHeight: MediaQuery.of(context).size.height * 0.1,
//          maxWidth: MediaQuery.of(context).size.width),
//      child: Row(
//        children: <Widget>[
//          TextField(
//            decoration: InputDecoration(
//              suffixText: "",
//              prefixIcon: ,
//            ),
//          )
//        ],
//      ),
//    );
//  }
}
