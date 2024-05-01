import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:hush_day/service/bloc_service.dart';
// import 'package:hush_day/view/cardform.dart';
// import 'package:hush_day/view/index.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hush_day/view/cardform.dart';
import 'package:hush_day/view/home_page.dart';
import '.env';
import 'view/example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51O3X03SCjJF4RQVbLjwNSpSArhf0lISnz15OQlrILv8tOvjFpekMKStuAzOqDhl2HxEz4s0xtcgcqDQcUxDQX9f600WcvUslMM'; // Replace with your publishable key
  runApp(GetMaterialApp(
    initialRoute: '/',
    //fade in transition
    transitionDuration: const Duration(milliseconds: 500),
    defaultTransition: Transition.fadeIn,
    // defaultTransition: Transition.fadeIn,
    getPages: [
      GetPage(
        name: '/',
        page: () => const HomePage(),
      ),
    ],
  ));
}


