import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/components/categories.dart';
import 'package:pi/Pages/Home/components/categories1.dart';
import 'package:pi/Pages/Home/components/discount_banner.dart';
import 'package:pi/Pages/Pricelist10/pricelist10_page.dart';
import 'package:pi/Pages/Profile/account_profile.dart';
import 'package:pi/Pages/Profile/components/profile_menu.dart';
import 'package:pi/Pages/Profile/profile_screen.dart';
import 'package:pi/Pages/Reservation/confirmationorder.dart';
import 'package:pi/Pages/Reservation/history_page.dart';
import 'package:pi/Pages/Reservation/information_detail.dart';
import 'package:pi/Pages/Reservation/menudropdown.dart';
import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  get _auth => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarListView(),
    );
  }
}

class BelajarListView extends StatelessWidget {
  final List bulan = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("belajarFlutter.com"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(bulan[index], style: TextStyle(fontSize: 30)),
            ),
          );
        },
        itemCount: bulan.length,
      ),
    );
  }
}
