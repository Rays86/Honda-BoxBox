import 'package:flutter/material.dart';
import 'package:pi/services/auth.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'components/body.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarySuperLightColor,
        title: const Text("Log in"),
      ),
      body: const Body(),
    );
  }
}
