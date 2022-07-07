import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pi/Pages/Pricelist6/components/body.dart';
import 'package:provider/provider.dart';
import 'package:pi/services/auth.dart';
import 'package:pi/services/database.dart';

class Pricelist6Page extends StatelessWidget {
  static String routeName = "/pricelist6_page";

  Pricelist6Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
