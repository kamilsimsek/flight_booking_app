import 'package:flutter/material.dart';
import 'package:ucak/models/reservation_expansion_item.dart';

class ReservationItemBodyView extends StatelessWidget {
  final ReservationExpansionBody body;
  const ReservationItemBodyView({Key? key, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Müşteri Adı: ${body.customer.customerName}'),
          Text('Telefon No: ${body.customer.mobile}'),
          Text('Mail: ${body.customer.email}'),
          Text('Toplam Koltuk: ${body.totalSeatedBooked}'),
          Text('Koltuk Numarası: ${body.seatNumbers}'),
          Text('Toplam Fiyat: ${body.totalPrice} t'),
        ],
      ),
    );
  }
}
