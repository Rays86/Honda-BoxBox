import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Login/login_page.dart';
import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/components/custom_bottom_nav_bar.dart';
import 'package:pi/enums.dart';
import 'package:pi/services/auth.dart';
import 'package:pi/size_config.dart';
import 'components/profile_menu.dart';

class AccountProfile extends StatefulWidget {
  static String routeName = "/account_profile";

  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  final AuthService _auth = AuthService();

  Future<DocumentSnapshot> getData() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    return await Firestore.instance
        .collection('boxbox')
        .document(firebaseUser.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(22)),
              Container(
                // height: 90,
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFC62828),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      const TextSpan(text: "BoxBox\n"),
                      TextSpan(
                        text: "Akun Saya",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 80.0,
                      child: Image(
                        image: AssetImage('assets/images/user2.png'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: FutureBuilder(
                          future: getData(),
                          builder: (context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data!['Name'],
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  Text(
                                    snapshot.data!['email'],
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(snapshot.data!['phoneNumber']),
                                ],
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.none) {
                              return Text("No Data");
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: 340.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
              ProfileMenu(
                text: "Kembali ke Home",
                icon: "assets/icons/Shop Icon.svg",
                press: () async {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () async {
                  await _auth.signOut();
                  Navigator.pushNamed(context, SplashPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
