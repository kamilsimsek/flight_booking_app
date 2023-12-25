import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:ucak/api/firebase_api.dart';
import 'package:ucak/firebase_options.dart';
import 'package:ucak/pages/add_plane_page.dart';
import 'package:ucak/pages/add_route_page.dart';
import 'package:ucak/pages/add_schedule_page.dart';
import 'package:ucak/pages/booking_confirmation_page.dart';
import 'package:ucak/pages/loginPage.dart';
import 'package:ucak/pages/register_page.dart';
import 'package:ucak/pages/search_page.dart';
import 'package:ucak/pages/seat_plan_page.dart';
import 'package:ucak/pages/seferler_page.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAdB1fhk1FstbGGrOMBWHzp_h8BxfrAp68",
              appId: "1:43193831049:android:13263940b61ea73648c058",
              messagingSenderId: "43193831049",
              projectId: "ucak-mobil"))
      : await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: "register",
      routes: {
        "register": (context) => const registerPage(),
        "login": (context) => const loginPage(),
        "search": (context) => const SearchPage(),
        "seferler": (context) => const seferlerPage(),
        "seatPlan": (context) => const SeatPlanPage(),
        "bookingConfirmation": (context) => const BookingConfirmationPage(),
        "addPlane": (context) => const addPlanePage(),
        "addRoute": (context) => const AddRoutePage(),
        "addSchedule": (context) => const AddSchedulePage(),
      },
    );
  }
}
