import 'package:flutter/material.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Profile/components/profile_menu.dart';
import 'package:pi/Pages/Reservation/confirmationorder.dart';
import 'package:pi/Pages/Reservation/menudropdown.dart';
import 'package:pi/components/default_button1.dart';
import 'package:pi/size_config.dart';
import 'TitleName.dart';
import 'dart:async';

class InformationDetail extends StatefulWidget {
  static String routeName = "/information_detail";
  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  late String addressText, addNotes, serviceType, carModels, addOnServices;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
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
                          text: "Buat Reservasi",
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
                  // Wrap Column
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TitleName(
                          titleText: 'Tipe Servis',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Tipe Servis'),
                                    content: Text(
                                      'Pilih jenis servis yang anda butuhkan',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        MenuDropDown(
                          dropdownText: 'Pilih Tipe Servis...',
                          type: "serviceType",
                          onChanged: (value) {
                            serviceType = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Model Mobil',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Model Mobil'),
                                    content: Text(
                                      'Pilih model mobil anda',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        MenuDropDown(
                          dropdownText: 'Pilih Model Mobil...',
                          type: "carModels",
                          onChanged: (value) {
                            carModels = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Layanan Tambahan',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Layanan Tambahan'),
                                    content: Text(
                                      'Pilih layanan tambahan',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        MenuDropDown(
                          dropdownText: 'Pilih Servis Tambahan...',
                          type: "addOnServices",
                          onChanged: (value) {
                            addOnServices = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Tanggal Reservasi',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Tanggal Reservasi'),
                                    content: Text(
                                      'Pilih tanggal reservasi',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 30,
                              margin: EdgeInsets.fromLTRB(50.0, 0, 62, 0),
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 4,
                                child: Text(
                                  'Pilih Tanggal',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ),
                            Text("${selectedDate.toLocal()}".split(" ")[0]),
                          ],
                        ),
                        TitleName(
                          titleText: 'Waktu Reservasi',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Waktu Reservasi'),
                                    content: Text(
                                      'Pilih waktu reservasi',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 30,
                              margin: EdgeInsets.fromLTRB(50.0, 0, 40, 0),
                              decoration: BoxDecoration(),
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  'Pilih Waktu',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 4,
                                onPressed: () => _selectTime(context),
                              ),
                            ),
                            Text("${selectedTime.toString()}".split(' ')[0]),
                          ],
                        ),
                        TitleName(
                          titleText: 'Alamat Rumah',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Alamat Rumah'),
                                    content: Text(
                                      'Tulis alamat rumah anda',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        Container(
                          width: 320,
                          height: 40,
                          child: TextFormField(
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
                              hintText: 'Tulis Alamat Rumah Anda...',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onChanged: (value) {
                              addressText = value;
                            },
                          ),
                        ),
                        TitleName(
                          titleText: 'Catatan Tambahan',
                          infoIcon: Icons.info_outline,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Catatan Tambahan'),
                                    content: Text(
                                      'Tulis catatan tambahan',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          },
                        ),
                        Container(
                          width: 320,
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
                              hintText: '',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onChanged: (value) {
                              addNotes = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 25.0, 0, 0),
                          width: 320.0,
                          child: DefaultButton1(
                            text: "Lanjutkan",
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ConfirmationOrder(
                                    serviceType: serviceType,
                                    carModels: carModels,
                                    addOnServices: addOnServices,
                                    selectedDate:
                                        selectedDate.toString().split(' ')[0],
                                    selectedTime: selectedTime.toString(),
                                    addressText: addressText,
                                    addNotes: addNotes,
                                    value: '',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
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
        ],
      )),
    );
  }
}
