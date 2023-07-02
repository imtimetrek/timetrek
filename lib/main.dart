import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timetrek/404_page.dart';
import 'package:timetrek/TEST/otp_verify_page.dart';
import 'package:timetrek/TEST/registration_page.dart';
import 'package:timetrek/helper/helper_function.dart';
import 'package:timetrek/pages/Intro/intro1_page.dart';
import 'package:timetrek/pages/auth/login_page.dart';
import 'package:timetrek/pages/auth/register_page.dart';
import 'package:timetrek/pages/drawer/home_page.dart';
import 'package:timetrek/pages/drawer/profile_page.dart';
import 'package:timetrek/pages/drawer/settings_page.dart';
import 'package:timetrek/pages/drawer/topic_page.dart';
import 'package:timetrek/pages/tabs/notification_tab.dart';
import 'package:timetrek/pages/tabs/search_tab.dart';
import 'package:timetrek/shared/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() :  Into1Page(),

      //home: RegistrationForm(),



      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/register':
            return MaterialPageRoute(builder: (context) => RegisterPage());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginPage());
          case '/profile':
            return MaterialPageRoute(builder: (context) => ProfilePage());
          case '/topic':
            return MaterialPageRoute(builder: (context) => TopicPage());
          case '/group':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/settings':
            return MaterialPageRoute(builder: (context) => SettingsPage());
          case '/search':
            return MaterialPageRoute(builder: (context) => SearchTab());
          case '/notification':
            return MaterialPageRoute(builder: (context) => NotificationTab());
          default:
          // Handle unknown routes here
            return MaterialPageRoute(builder: (context) => Four04Page());
        }
      },



    );
  }
}

