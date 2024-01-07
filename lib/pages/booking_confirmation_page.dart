import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ucak/models/customer.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';

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
  late User? _user;
  bool isFirst = true;

  @override
  void initState() {
    _getUserInfo();

    nameController.text = "";
    mobileController.text = '';
    emailController.text = _user!.email!;
    super.initState();
  }

  Future<void> _getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
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
        title: const Text('Rezervasyonu Onayla'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Lütfen yolcu bilgilerini giriniz',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Musteri Adi',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Telefon Numarası',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
            //Text("data " + _user!.email!),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
              padding: EdgeInsets.only(left: 8, right: 8, top: 12),
              child: Text(
                'Rezervasyon Bilgileri:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Müşteri Adı: ${nameController.text}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Telefon Numarası ${mobileController.text}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mail Adresi: ${emailController.text}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Güzergah: ${schedule.flightRoute.routeName}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Kalkış Tarihi: $departureDate',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Kalkış Saati: ${schedule.departureTime}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Bilet Fiyatı: ${schedule.ticketPrice}TL',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Seçilen Koltuk Sayısı: $totalSeatsBooked',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Koltuk Numaraları: $seatNumbers',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'İndirim: ${schedule.discount}%',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Vergi ): ${schedule.processingFee}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Toplam Fiyat: ${getGrandTotal(schedule.discount, totalSeatsBooked, schedule.ticketPrice, schedule.processingFee)}TL',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: const Text('Rezervasyonu Onayla'),
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
      final customer = Customer(
        customerName: nameController.text,
        mobile: mobileController.text,
        email: emailController.text,
      );

      final reservation = FlightReservation(
        //reservationId: TempDB.flightReservationList.length + 1,
        customer: customer,
        flightSchedule: schedule,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        departureDate: departureDate,
        totalSeatBooked: totalSeatsBooked,
        seatNumbers: seatNumbers,
        reservationStatus: reservationActive,
        totalPrice: getGrandTotal(schedule.discount, totalSeatsBooked,
            schedule.ticketPrice, schedule.processingFee),
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addReservation(reservation)
          .then((response) {
        print("aaa");
        print(reservation);
        if (response.responseStatus == ResponseStatus.SAVED) {
          showMsg(context, "Rezervasyon Kaydedildi");
          Navigator.popUntil(context, ModalRoute.withName("search"));
        } else {
          showMsg(context, response.message);
        }
      }).catchError((error) {
        showMsg(context, "Kaydedilemedi");
      });
    }
  }
}
