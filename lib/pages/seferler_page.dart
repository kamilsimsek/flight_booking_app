import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class seferlerPage extends StatelessWidget {
  const seferlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final FlightRoute route = argList[0];
    final String departureDate = argList[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Sonuçları'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
            '$departureDate tarihinde ${route.cityFrom}-${route.cityTo} için uçuşlar: ',
            style: const TextStyle(fontSize: 18),
          ),
          Consumer<AppDataProvider>(
            builder: (context, provider, _) =>
                FutureBuilder<List<FlightSchedule>>(
              future: provider.getSchedulesByRouteName(route.routeName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final scheduleList = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: scheduleList
                        .map((schedule) => ScheduleItemView(
                            schedule: schedule, date: departureDate))
                        .toList(),
                  );
                }
                if (snapshot.hasError) {
                  return const Text('Veriler Çekilemedi');
                }
                return const Text('Lütfen bekleyin');
              },
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleItemView extends StatelessWidget {
  final String date;
  final FlightSchedule schedule;

  const ScheduleItemView({Key? key, required this.schedule, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "seatPlan", arguments: [schedule, date]),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(schedule.plane.planeName),
              subtitle: Text(schedule.plane.planeType),
              trailing: Text('${schedule.ticketPrice}TL'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Nereden: ${schedule.flightRoute.cityFrom}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Nereye: ${schedule.flightRoute.cityTo}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Kalkış Zamanı: ${schedule.departureTime}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Total Seat: ${schedule.plane.totalSeat}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
