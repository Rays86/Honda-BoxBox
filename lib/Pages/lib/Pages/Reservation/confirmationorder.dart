import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/reservation_success/reservation_success_page.dart';
import 'package:pi/components/default_button1.dart';
import 'package:pi/size_config.dart';

class ConfirmationOrder extends StatefulWidget {
  static const String id = 'ConfirmationOrder';
  final String addressText, addNotes, serviceType, carModels, addOnServices;
  final String selectedDate;
  final String selectedTime;

  ConfirmationOrder({
    required this.addressText,
    required this.addNotes,
    required this.addOnServices,
    required this.carModels,
    required this.serviceType,
    required this.selectedDate,
    required this.selectedTime,
    required String value,
    FirebaseUser? firebaseUser,
  });
  @override
  _ConfirmationOrderState createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  late String userId;
  late String name;
  late String email;
  late String phoneNumber;
  final _firestore = Firestore.instance;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = firebaseUser.uid;
      name = firebaseUser.displayName;
      phoneNumber = firebaseUser.phoneNumber;
      email = firebaseUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                          text: "Konfirmasi Pesanan",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(26.0, 20.0, 26.0, 25.0),
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  height: 365.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ConfirmationText(
                          confirmText: 'Jenis Servis : ' + widget.serviceType),
                      ConfirmationText(
                          confirmText: 'Model Mobil : ' + widget.carModels),
                      ConfirmationText(
                          confirmText:
                              'Servis Tambahan : ' + widget.addOnServices),
                      ConfirmationText(
                          confirmText:
                              'Tanggal Reservasi : ' + widget.selectedDate),
                      ConfirmationText(
                          confirmText:
                              'Waktu Reservasi : ' + widget.selectedTime),
                      ConfirmationText(
                          confirmText: 'Alamat Rumah : ' + widget.addressText),
                      ConfirmationText(
                          confirmText: 'Catatan Tambahan : ' + widget.addNotes),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: 320.0,
                  height: 50.0,
                  child: DefaultButton1(
                    text: "Reservasi Sekarang",
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final reservationData =
                            await _firestore.collection('ReservationData').add({
                          'uid': userId,
                          'Name': name,
                          'Phone Number': phoneNumber,
                          'Email': email,
                          'Car Brands': widget.carModels,
                          'Service Type': widget.serviceType,
                          'Add-On': widget.addOnServices,
                          'Address': widget.addressText,
                          'Reservation Date': widget.selectedDate,
                          'Reservation Time': widget.selectedTime,
                          'Add Notes': widget.addNotes,
                        });
                        if (reservationData != null) {
                          Navigator.pushNamed(
                              context, ReservationSuccessPage.routeName);
                        }
                        setState(() {
                          showSpinner = true;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                    'Dengan melanjutkan, kami akan mengonfirmasi \nbahwa semua data di atas benar',
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationText extends StatelessWidget {
  ConfirmationText({required this.confirmText});
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        confirmText,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
