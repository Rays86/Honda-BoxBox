import 'package:flutter/material.dart';
import 'package:pi/components/custom_bottom_nav_bar.dart';
import 'package:pi/enums.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return const Scaffold(
      body: Body(),
    );
  }
}
