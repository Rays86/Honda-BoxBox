import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/components/categories1.dart';
import 'package:pi/Pages/Prices/prices_page.dart';
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
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

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
            const Categories(),
            SizedBox(height: getProportionateScreenHeight(20)),
            ProfileMenu(
              text: "Buat Reservasi",
              icon: "assets/icons/reservation1.svg",
              press: () {
                Navigator.pushNamed(context, InformationDetail.routeName);
              },
            ),
            ProfileMenu(
              text: "Riwayat Reservasi",
              icon: "assets/icons/history1.svg",
              press: () {
                Navigator.pushNamed(context, HistoryPage.routeName);
              },
            ),
            ProfileMenu(
              text: "Daftar Harga Servis",
              icon: "assets/icons/clipboard.svg",
              press: () {
                Navigator.pushNamed(context, PricesPage.routeName);
              },
            ),
            ProfileMenu(
              text: "Profil Akun",
              icon: "assets/icons/User Icon.svg",
              press: () {
                Navigator.pushNamed(context, AccountProfile.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
