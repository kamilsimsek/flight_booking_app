import 'package:firebase_core/firebase_core.dart';
import 'package:ucak/pages/add_plane_page.dart';
import 'package:ucak/pages/add_route_page.dart';
import 'package:ucak/pages/add_schedule_page.dart';
import 'package:ucak/pages/booking_confirmation_page.dart';
import 'package:ucak/pages/loginPage.dart';
import 'package:ucak/pages/register_page.dart';
import 'package:ucak/pages/reservation_page.dart';
import 'package:ucak/pages/search_page.dart';
import 'package:ucak/pages/seat_plan_page.dart';
import 'package:ucak/pages/seferler_page.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucak/services/notification_service.dart';
import 'package:ucak/utils/notification_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationHelper.initialize();

  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _service = FirebaseNotificationService();

  @override
  @override
  void initState() {
    super.initState();
    _service.connectNotification();
  }

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
        "reservation": (context) => const ReservationPage(),
      },
    );
  }
}
