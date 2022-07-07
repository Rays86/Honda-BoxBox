import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/models/user.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return SplashPage();
    } else {
      return HomePage();
    }
  }
}
