import 'package:ucak/customwidgets/seat_plan_view.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({Key? key}) : super(key: key);

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  late FlightSchedule schedule;
  late String departureDate;
  int totalSeatBooked = 0;
  String bookedSeatNumbers = '';
  List<String> selectedSeats = [];
  bool isFirst = true;
  bool isDataLoading = true;
  ValueNotifier<String> selectedSeatStringNotifier = ValueNotifier('');

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    schedule = argList[0];
    departureDate = argList[1];
    _getData();
    super.didChangeDependencies();
  }

  _getData() async {
    final resList = await Provider.of<AppDataProvider>(context, listen: false)
        .getReservationsByScheduleAndDepartureDate(
            schedule.scheduleId!, departureDate);
    setState(() {
      isDataLoading = false;
    });
    List<String> seats = [];
    for (final res in resList) {
      totalSeatBooked += res.totalSeatBooked;
      seats.add((res.seatNumbers));
    }
    bookedSeatNumbers = seats.join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Plan'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Rezerve',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Alınabilir',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedSeatStringNotifier,
              builder: (context, value, _) => Text(
                'Seçili: $value',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (!isDataLoading)
              Expanded(
                child: SingleChildScrollView(
                  child: SeatPlanView(
                    onSeatSelected: (value, seat) {
                      if (value) {
                        selectedSeats.add(seat);
                      } else {
                        selectedSeats.remove(seat);
                      }
                      selectedSeatStringNotifier.value =
                          selectedSeats.join(',');
                    },
                    totalSeatBooked: totalSeatBooked,
                    bookedSeatNumbers: bookedSeatNumbers,
                    totalSeat: schedule.plane.totalSeat,
                    isBusinessClass: schedule.plane.planeType == Private,
                  ),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                if (selectedSeats.isEmpty) {
                  showMsg(context, 'Lütfen önce koltuk seçiniz');
                  return;
                }
                Navigator.pushNamed(context, "bookingConfirmation", arguments: [
                  departureDate,
                  schedule,
                  selectedSeatStringNotifier.value,
                  selectedSeats.length
                ]);
              },
              child: const Text(
                'Rezervasyon Bilgileri',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
