// @dart=2.9

import 'package:flutter/material.dart';
import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/Pages/wrapper.dart';
import 'package:pi/constants.dart';
import 'package:pi/routs.dart';
import 'package:pi/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:pi/models/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  get kTextColor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PI',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColor),
            bodyText2: TextStyle(color: kTextColor),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
        initialRoute: SplashPage.routeName,
        routes: routes,
      ),
    );
  }
}
