import 'package:flutter/material.dart';
import 'package:pi/components/default_button.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Registrasi Berhasil!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Kembali ke home",
            press: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
