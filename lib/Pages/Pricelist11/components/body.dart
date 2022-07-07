import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/components/categories.dart';
import 'package:pi/Pages/Home/components/categories1.dart';
import 'package:pi/Pages/Home/components/discount_banner.dart';
import 'package:pi/Pages/Pricelist11/pricelist11_page.dart';
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

import '../../../constants.dart';
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
    'Isi Ulang Freon A/C : Rp.250,000',
    'Penggantian Baterai : Rp.950,000',
    'Isi Ulang Baterai : Rp.25,000',
    'Penggantian Drive Belt : Rp.350,000',
    'Penggantian Timing Belt : -',
    'Penggantian Kampas Rem Depan : Rp.1,500,000',
    'Penggantian Kampas Rem Belakang : Rp.1,000,000',
    'Penggantian Piringan Rem Depan : Rp.800,000',
    'Penggantian Piringan Rem Belakang : Rp.500,000',
    'Kuras Minyak Rem : Rp.150,000',
    'Penggantian Filter Udara Kabin : Rp.100,000',
    'Cuci Mobil : Rp.50,000',
    'Detailing Mobil : Rp.500,000',
    'Ceramic Coating Mobil : Rp.4,200,000',
    'Penggantian Filter Udara Mesin : Rp.100,000',
    'Ganti Oli Mesin : Rp.600,000',
    'Ganti Filter Oli Mesin : Rp.50,000',
    'Penggantian Busi Mesin : Rp.1,000,000',
    'Tune Up Mesin : Rp.500,000',
    'Penggantian Filter Bahan Bakar : Rp.750,000 ',
    'Pembersihan Injeksi Bahan Bakar : Rp.250,000',
    'Perbaikan Radiator : Rp.1,000,000',
    'Isi Ulang Air Radiator : Rp.25,000',
    'Kuras Air Radiator : Rp.200,000',
    'Perbaikan Suspensi : Rp.1,000,000/suspensi',
    'Penggantian Shock Suspensi Depan : Rp.4,000,000',
    'Penggantian Pegas Suspensi Depan : Rp.2,000,000',
    'Penggantian Shock Suspensi Belakang : Rp.3,600,000',
    'Penggantian Pegas Suspensi Belakang : Rp.1,600,000',
    'Perbaikan Transmisi : Rp.10,000,000',
    'Ganti Oli Transmisi : Rp.350,000',
    'Kuras Oli Transmisi : Rp.900,000',
    'Perbaikan Ban : Rp.100,000/ban',
    'Ganti Ban : Rp.1,500,000/ban',
    'Isi Ban dengan Nitrogen : Rp.8,000/ban'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Daftar Harga Servis Honda Odyssey"),
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
