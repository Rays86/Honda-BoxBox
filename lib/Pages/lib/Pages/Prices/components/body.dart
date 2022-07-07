import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/components/categories.dart';
import 'package:pi/Pages/Home/components/categories1.dart';
import 'package:pi/Pages/Prices/components/discount_banner.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Prices/prices_page.dart';
import 'package:pi/Pages/Pricelist1/pricelist1_page.dart';
import 'package:pi/Pages/Pricelist10/pricelist10_page.dart';
import 'package:pi/Pages/Pricelist11/pricelist11_page.dart';
import 'package:pi/Pages/Pricelist2/pricelist2_page.dart';
import 'package:pi/Pages/Pricelist3/pricelist3_page.dart';
import 'package:pi/Pages/Pricelist4/pricelist4_page.dart';
import 'package:pi/Pages/Pricelist5/pricelist5_page.dart';
import 'package:pi/Pages/Pricelist6/pricelist6_page.dart';
import 'package:pi/Pages/Pricelist7/pricelist7_page.dart';
import 'package:pi/Pages/Pricelist8/pricelist8_page.dart';
import 'package:pi/Pages/Pricelist9/pricelist9_page.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const DiscountBanner(),
            Text(
              'Pilih Model Mobil Anda',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            ProfileMenu(
              text: "Honda Accord",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist1Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda Brio",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist2Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda BRV",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist3Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda City Sedan",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist4Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda City Hatchback",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist5Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda Civic",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist6Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda CRV",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist7Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda HRV",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist8Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda Jazz",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist9Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda Mobilio",
              icon: "assets/icons/hondalogo.svg",
              press: () {
                Navigator.pushNamed(context, Pricelist10Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Honda Odyssey",
              icon: "assets/icons/hondalogo.svg",
              press: () async {
                Navigator.pushNamed(context, Pricelist11Page.routeName);
              },
            ),
            ProfileMenu(
              text: "Kembali ke Home",
              icon: "assets/icons/Shop Icon.svg",
              press: () async {
                Navigator.pushNamed(context, HomePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
