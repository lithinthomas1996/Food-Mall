import 'package:flutter/material.dart';
import 'package:my_test_appp/app_ui/auth/login.dart';
import 'package:my_test_appp/app_ui/auth/otp_verify.dart';
import 'package:my_test_appp/app_ui/home/food_items_listing.dart';
import 'package:my_test_appp/app_ui/home/home_screen.dart';
 import 'package:my_test_appp/app_ui/splash_screen.dart';

import '../app_ui/auth/registartion.dart';

class  Routes{
  static final Map<String, Widget Function(BuildContext)> a= {
    '/': (context) =>   SplashScreen(),
    '/homeScreen': (context) =>   HomeScreen(),
    '/registration': (context) =>   Registration(),
    '/login': (context) =>   Login(),
    '/verify': (context) =>   Verify(authVerifyArguments:   ModalRoute.of(context)!.settings.arguments! as AuthVerifyArguments,),
    '/foodItemsListing': (context) =>   FoodItemsListing(itemsListingArguments:   ModalRoute.of(context)!.settings.arguments! as ItemsListingArguments,),

  };
}