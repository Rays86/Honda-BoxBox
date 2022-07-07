import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarySuperLightColor,
        title: const Text("Sign Up"),
      ),
      body: const Body(),
    );
  }
}
