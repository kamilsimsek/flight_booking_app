import 'package:flutter/material.dart';
import 'package:ucak/models/reservation_expansion_item.dart';
import 'package:ucak/utils/helper_functions.dart';

class ReservationItemHeaderView extends StatelessWidget {
  final ReservationExpansionHeader header;
  const ReservationItemHeaderView({Key? key, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('${header.departureDate} ${header.schedule.departureTime}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${header.schedule.flightRoute.routeName}-${header.schedule.plane.planeType}'),
            Text(
                'Rezervasyon Tarihi: ${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp), pattern: 'EEE MMM dd yyyy HH:mm')}'),
          ],
        ),
      ),
    );
  }
}
