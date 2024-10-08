import 'package:get/get.dart';
import 'package:socials/views/screens/auth/signUp.dart';
import 'package:socials/views/screens/auth/sign_in.dart';
import 'package:socials/views/screens/home_screen/home_screen.dart';
import 'package:socials/views/screens/splash_screen/splash_screen.dart';

class AppRoutes{
  static const String splash="/splash";
  static const String signUp="/signUp";
  static const String signIn="/signIn";
  static const String home="/home";


  static List<GetPage> routes=[
    GetPage(name: splash, page:()=> SplashScreen()),
    GetPage(name: signUp, page:()=> Signup()),
    GetPage(name: home, page:()=> HomeScreen()),
    GetPage(name: signIn, page:()=> SignIn()),
  ];

}