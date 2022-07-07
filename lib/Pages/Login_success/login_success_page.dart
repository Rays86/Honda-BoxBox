import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pi/Pages/Login_success/components/body.dart';
import 'package:provider/provider.dart';
import 'package:pi/services/auth.dart';
import 'package:pi/services/database.dart';

class LoginSuccessPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  static String routeName = "/login_success";

  LoginSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
    );
  }
}
