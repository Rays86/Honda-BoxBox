import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories1 extends StatelessWidget {
  const Categories1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories1 = [
      {"icon": "assets/icons/tow-truck.svg", "text": "Tow Service"},
      {"icon": "assets/icons/suspension.svg", "text": "Shocks"},
      {"icon": "assets/icons/radiator.svg", "text": "Radiator"},
      {"icon": "assets/icons/air-conditioner.svg", "text": "A/C"},
      {"icon": "assets/icons/gearstick.svg", "text": "Transmission"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories1.length,
          (index) => CategoryCard(
            icon: categories1[index]["icon"],
            text: categories1[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
