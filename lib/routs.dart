import 'package:flutter/widgets.dart';
import 'package:pi/Pages/Cart/cart_screen.dart';
import 'package:pi/Pages/Details/details_screen.dart';
import 'package:pi/Pages/Home/home_page.dart';
import 'package:pi/Pages/Login/login_page.dart';
import 'package:pi/Pages/Login_success/login_success_page.dart';
import 'package:pi/Pages/OTP/otp_screen.dart';
import 'package:pi/Pages/Profile/account_profile.dart';
import 'package:pi/Pages/Profile/profile_screen.dart';
import 'package:pi/Pages/Reservation/history_page.dart';
import 'package:pi/Pages/Reservation/information_detail.dart';
import 'package:pi/Pages/Sign_up/sign_up_page.dart';
import 'package:pi/Pages/Signup_success/signup_success_page.dart';
import 'package:pi/Pages/Splash/splash_page.dart';
import 'package:pi/Pages/forgot_password/forgot_password_page.dart';
import 'package:pi/models/Cart.dart';
import 'Pages/Pricelist1/pricelist1_page.dart';
import 'Pages/Pricelist10/pricelist10_page.dart';
import 'Pages/Pricelist11/pricelist11_page.dart';
import 'Pages/Pricelist2/pricelist2_page.dart';
import 'Pages/Pricelist3/pricelist3_page.dart';
import 'Pages/Pricelist4/pricelist4_page.dart';
import 'Pages/Pricelist5/pricelist5_page.dart';
import 'Pages/Pricelist6/pricelist6_page.dart';
import 'Pages/Pricelist7/pricelist7_page.dart';
import 'Pages/Pricelist8/pricelist8_page.dart';
import 'Pages/Pricelist9/pricelist9_page.dart';
import 'Pages/Prices/prices_page.dart';
import 'Pages/Reservation_success/reservation_success_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  LoginSuccessPage.routeName: (context) => LoginSuccessPage(),
  SignupSuccessPage.routeName: (context) => SignupSuccessPage(),
  ReservationSuccessPage.routeName: (context) => ReservationSuccessPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  OTPScreen.routeName: (context) => OTPScreen(),
  HomePage.routeName: (context) => const HomePage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  AccountProfile.routeName: (context) => AccountProfile(),
  InformationDetail.routeName: (context) => InformationDetail(),
  HistoryPage.routeName: (context) => HistoryPage(),
  PricesPage.routeName: (context) => PricesPage(),
  Pricelist1Page.routeName: (context) => Pricelist1Page(),
  Pricelist2Page.routeName: (context) => Pricelist2Page(),
  Pricelist3Page.routeName: (context) => Pricelist3Page(),
  Pricelist4Page.routeName: (context) => Pricelist4Page(),
  Pricelist5Page.routeName: (context) => Pricelist5Page(),
  Pricelist6Page.routeName: (context) => Pricelist6Page(),
  Pricelist7Page.routeName: (context) => Pricelist7Page(),
  Pricelist8Page.routeName: (context) => Pricelist8Page(),
  Pricelist9Page.routeName: (context) => Pricelist9Page(),
  Pricelist10Page.routeName: (context) => Pricelist10Page(),
  Pricelist11Page.routeName: (context) => Pricelist11Page(),
};
