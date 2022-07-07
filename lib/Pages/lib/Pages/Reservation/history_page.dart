import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Profile/components/profile_menu.dart';
import 'package:pi/components/custom_bottom_nav_bar.dart';
import 'package:pi/size_config.dart';
import 'package:pi/services/auth.dart';

import '../../enums.dart';

class HistoryPage extends StatefulWidget {
  static String routeName = "/history_page";
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _firestore = Firestore.instance;
  late String userId;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = firebaseUser.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.021),
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
                    text: "Riwayat Reservasi",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('ReservationData')
                    .where("uid", isEqualTo: userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data!.documents;
                  List<HistoryBox> historyWidgets = [];
                  for (var message in messages) {
                    final historyService = message.data['Service Type'];
                    final historyCar = message.data['Car Brands'];
                    final historyDate = message.data['Reservation Date'];
                    final historyTime = message.data['Reservation Time'];
                    final historyWidget = HistoryBox(
                        service: historyService,
                        car: historyCar,
                        date: historyDate,
                        time: historyTime);
                    historyWidgets.add(historyWidget);
                  }
                  return Column(
                    children: historyWidgets,
                  );
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              ProfileMenu(
                text: "Kembali ke Home",
                icon: "assets/icons/Shop Icon.svg",
                press: () async {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}

class HistoryBox extends StatelessWidget {
  final String service;
  final String car;
  final String date;
  final String time;

  HistoryBox(
      {required this.service,
      required this.car,
      required this.date,
      required this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
      child: Material(
        elevation: 5.0,
        child: Container(
          child: Text(
            '▸ Tanggal Reservasi : \n $date and $time \n▸ Jenis Servis : \n $service \n▸ Model Mobil : \n $car',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
