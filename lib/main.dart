import 'package:evntown/screens/all_profile_screens/add_freind_screen.dart';
import 'package:evntown/screens/all_profile_screens/display_follower_screen.dart';
import 'package:evntown/screens/all_profile_screens/settings_screen.dart';
import 'package:evntown/screens/auth_screen/login_screen.dart';
import 'package:evntown/screens/auth_screen/signup_screen.dart';
import 'package:evntown/screens/event_screens/create_event.dart';
import 'package:evntown/screens/event_screens/display_single_event.dart';
import 'package:evntown/screens/event_screens/event_history.dart';
import 'package:evntown/screens/event_screens/interest_event.dart';
import 'package:evntown/screens/event_screens/trending_event.dart';
import 'package:evntown/screens/main_screen.dart';
import 'package:evntown/screens/notification_screen.dart';
import 'package:evntown/screens/onbording.dart';
import 'package:evntown/screens/social_screen/chat_screen.dart';
import 'package:evntown/screens/timeline_screens/timeline_screen.dart';
import 'package:evntown/screens/utilities_screen/about_us.dart';
import 'package:evntown/screens/utilities_screen/feedback_screen.dart';
import 'package:evntown/screens/utilities_screen/help_screen.dart';
import 'package:evntown/utilities/home_new_method_class/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(EvnTown());

class EvnTown extends StatefulWidget {
  @override
  _EvnTownState createState() => _EvnTownState();
}

class _EvnTownState extends State<EvnTown> {
  bool isDark = false;

  //todo: make app can't back to onBoarding when app go to home screen

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
          '/settings': (context) => SettingsScreen(),
          '/timeL ine': (context) => TimeLineScreen(),
          '/trending': (context) => Trending(),
          '/today': (context) => Trending(),
          'friends': (context) => DisplayFriendsScreen(),
          '/singleEvent': (context) => SingleEventScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/addEvent': (context) => CreateEvent(),
          '/eventHistory': (context) => EventHistory(),
          '/interestEvent': (context) => InterestEvent(),
          '/notification': (context) => NotificationScreen(),
          '/addFriends': (context) => AddFriendScreen(),
          '/about': (context) => AboutUsScreen(),
          '/help': (context) => HelpScreen(),
          '/chat': (context) => ChatsScreen(),
          '/feed': (context) => FeedbackScreen(),
          '/logOut': (context) => LoginScreen(),
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
  Widget openWidget = OnBording();

  getScreenLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('screenLoging');
    bool isHome = prefs.getBool('screenHome');
    print(isHome);
    print(isLogin);
    if (isHome == false && isLogin == true) {
      setState(() {
        openWidget = LoginScreen();
      });
    } else if (isLogin == false && isHome == true) {
      setState(() {
        openWidget = MainScreen();
      });
    } else {
      setState(() {
        openWidget = OnBording();
      });
    }
  }

  @override
  void initState() {
    getScreenLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return openWidget;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
