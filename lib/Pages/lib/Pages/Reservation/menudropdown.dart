import 'package:flutter/material.dart';

typedef onChangeCallback = void Function(dynamic);

class MenuDropDown extends StatefulWidget {
  final String dropdownText;
  final String type;
  final onChangeCallback onChanged;
  MenuDropDown(
      {required this.dropdownText,
      required this.type,
      required this.onChanged});
  @override
  _MenuDropDownState createState() => _MenuDropDownState();
}

class _MenuDropDownState extends State<MenuDropDown> {
  String? selectedItem;
  List<String> dropdownItems = [];

  List<String> serviceTypeList = [
    'Isi Ulang Freon A/C',
    'Penggantian Baterai',
    'Isi Ulang Baterai',
    'Penggantian Drive Belt',
    'Penggantian Timing Belt',
    'Penggantian Kampas Rem Depan',
    'Penggantian Kampas Rem Belakang',
    'Penggantian Piringan Rem Depan',
    'Penggantian Piringan Rem Belakang',
    'Kuras Minyak Rem',
    'Penggantian Filter Udara Kabin',
    'Cuci Mobil',
    'Detailing Mobil',
    'Ceramic Coating Mobil',
    'Penggantian Filter Udara Mesin',
    'Ganti Oli Mesin',
    'Ganti Filter Oli Mesin',
    'Penggantian Busi Mesin',
    'Tune Up Mesin',
    'Penggantian Filter Bahan Bakar',
    'Pembersihan Injeksi Bahan Bakar',
    'Perbaikan Radiator',
    'Isi Ulang Air Radiator',
    'Kuras Air Radiator',
    'Perbaikan Suspensi',
    'Penggantian Shock Suspensi Depan',
    'Penggantian Pegas Suspensi Depan',
    'Penggantian Shock Suspensi Belakang',
    'Penggantian Pegas Suspensi Belakang',
    'Perbaikan Transmisi',
    'Ganti Oli Transmisi',
    'Kuras Oli Transmisi',
    'Perbaikan Ban',
    'Ganti Ban',
    'Isi Ban dengan Nitrogen'
  ];

  List<String> carModelsList = [
    'Honda Accord',
    'Honda Brio',
    'Honda BRV',
    'Honda City Sedan',
    'Honda City Hatchback',
    'Honda Civic',
    'Honda CRV',
    'Honda HRV',
    'Honda Jazz',
    'Honda Mobilio',
    'Honda Odyssey',
  ];

  List<String> addOnServicesList = [
    'Interior Fogging',
    'Layanan Derek Mobil',
    'Penggantian Baterai Kunci Mobil',
    'Pemeriksaan Baterai 12V',
    'Penggantian Mur Roda Roda',
    'Penggantian Bilah Wiper',
  ];

  List<String>? getListBasedOnName(String value) {
    switch (value) {
      case "serviceType":
        return serviceTypeList;

        break;
      case "carModels":
        return carModelsList;
        break;

      case "addOnServices":
        return addOnServicesList;
        break;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    dropdownItems = getListBasedOnName(widget.type)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
      child: Container(
        width: 325.0,
        height: 50.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 0.0),
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: selectedItem,
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 0),
                child: Text(
                  widget.dropdownText,
                  style: TextStyle(),
                ),
              ),
              items: dropdownItems.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: new Text(value),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
                widget.onChanged(value);
              }),
        ),
      ),
    );
  }
}
