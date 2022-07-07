import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Profile/account_profile.dart';
import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/services/auth.dart';
import 'package:pi/size_config.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            // height: 90,
            width: double.infinity,
            margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF4A3298),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: Colors.white),
                children: [
                  const TextSpan(text: "BoxBox\n"),
                  TextSpan(
                    text: "Profile",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.pushNamed(context, AccountProfile.routeName);
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {},
          ),
        ],
      ),
    );
  }
}
