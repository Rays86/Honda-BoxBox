import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pi/Pages/Pricelist10/components/body.dart';
import 'package:provider/provider.dart';
import 'package:pi/services/auth.dart';
import 'package:pi/services/database.dart';

class Pricelist10Page extends StatelessWidget {
  static String routeName = "/pricelist10_page";

  Pricelist10Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
