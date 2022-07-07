import 'package:flutter/material.dart';
import 'package:pi/Pages/Splash/components/body.dart';
import 'package:pi/size_config.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";

  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig.init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
