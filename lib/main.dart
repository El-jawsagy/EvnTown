import 'package:evntown/screens/utilities_screen/about_us.dart';
import 'package:evntown/screens/all_profile_screens/add_freind_screen.dart';
import 'package:evntown/screens/auth_screen/login_screen.dart';
import 'package:evntown/screens/auth_screen/signup_screen.dart';
import 'package:evntown/screens/event_screens/create_event.dart';
import 'package:evntown/screens/event_screens/event_history.dart';
import 'package:evntown/screens/event_screens/interest_event.dart';
import 'package:evntown/screens/main_screen.dart';
import 'package:evntown/screens/notification_screen.dart';
import 'package:evntown/screens/onbording.dart';
import 'package:evntown/screens/utilities_screen/feedback_screen.dart';
import 'package:evntown/screens/utilities_screen/help_screen.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(EvnTown());

class EvnTown extends StatefulWidget {
  @override
  _EvnTownState createState() => _EvnTownState();
}

class _EvnTownState extends State<EvnTown> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        routes: {
          '/home': (context) => MainScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/addEvent': (context) => CreateEvent(),
          '/eventHistory': (context) => EventHistory(),
          '/interestEvent': (context) => InterestEvent(),
          '/notification': (context) => NotificationScreen(),
          '/addFriends': (context) => FriendScreen(),
          '/about': (context) => AboutUsScreen(),
          '/help' : (context) => HelpScreen(),
          '/feed' : (context) => FeedbackScreen(),
          '/logOut' : (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,

        theme: isDark ? Constants.darkTheme : Constants.lightTheme,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return OnBording();
  }
}
