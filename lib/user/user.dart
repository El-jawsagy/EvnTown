import 'package:evntown/event/event.dart';
import 'package:evntown/event/event_controller.dart';
import 'package:evntown/image/image.dart';

class User {
  String id;

  String firstName;
  String lastName;
  String gender;
  String email;
  BaseImage image;
  List<BaseEvent> watchList;
  List<BaseEvent> myEvent;

  User(this.id, this.firstName, this.lastName, this.gender, this.email,
      this.image, this.watchList, this.myEvent);

  User.fromJson(Map<String, dynamic>jsonObject){
    this.id = jsonObject[ 'id' ];
    this.firstName = jsonObject[ 'first_name' ];
    this.lastName = jsonObject[ 'last_name' ];
    this.gender = jsonObject [ 'gender' ];
    this.image = BaseImage.fromJson(jsonObject[ 'image' ]);
    this.watchList = EventController.toEvents(jsonObject[ 'watch_list' ]);
    this.myEvent = EventController.toEvents(jsonObject[ 'my_event' ] );
  }
}