import 'dart:math';

import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/user.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingConfirmationPage extends StatefulWidget {
  const BookingConfirmationPage({Key? key}) : super(key: key);

  @override
  State<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  late FlightSchedule schedule;
  late String departureDate;
  late int totalSeatsBooked;
  late String seatNumbers;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  bool isFirst = true;

  @override
  void initState() {
    nameController.text = 'Mr. ABC';
    mobileController.text = '01711000001';
    emailController.text = 'abc@gmail.com';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirst) {
      final argList = ModalRoute.of(context)!.settings.arguments as List;
      departureDate = argList[0];
      schedule = argList[1];
      seatNumbers = argList[2];
      totalSeatsBooked = argList[3];
    }
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Booking'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please provide your information',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Customer Name',
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  filled: true,
                  prefixIcon: const Icon(Icons.call),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  filled: true,
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Booking Summery',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Name: ${nameController.text}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mobile Number: ${mobileController.text}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Email Address: ${emailController.text}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Route: ${schedule.flightRoute.routeName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Departure Date: $departureDate',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Departure Time: ${schedule.departureTime}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Ticket Price: t${schedule.ticketPrice}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Total Seat(s): $totalSeatsBooked',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Seat Number(s): $seatNumbers',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Discount: ${schedule.discount}%',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Processing Fee: t${schedule.processingFee}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Grand Total: t${getGrandTotal(schedule.discount, totalSeatsBooked, schedule.ticketPrice, schedule.processingFee)}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: const Text('CONFIRM BOOKING'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  void _confirmBooking() {
    if (_formKey.currentState!.validate()) {
      final user = User(
          id: 1,
          name: nameController.text,
          mail: mobileController.text,
          password: "",
          role: "");

      final reservation = FlightReservation(
        reservationId: TempDB.flightReservationList.length + 1,
        user: user,
        flightSchedule: schedule,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        departureDate: departureDate,
        totalSeatBooked: totalSeatsBooked,
        seatNumbers: seatNumbers,
        reservationStatus: "active",
        totalPrice: getGrandTotal(schedule.discount, totalSeatsBooked,
            schedule.ticketPrice, schedule.processingFee),
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addReservation(reservation)
          .then((response) {
        showMsg(context, "ayıt aşarılı");
        Navigator.popUntil(context, ModalRoute.withName("search"));
      }).catchError((error) {
        showMsg(context, 'Could not save');
      });
    }
  }
}
