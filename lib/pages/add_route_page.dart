import 'package:ucak/models/flight_route_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  FlightRoute? flightRoute;

  final _formKey = GlobalKey<FormState>();
  String kontroll = "";
  String? from, to;
  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rota Ekle'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            shrinkWrap: true,
            children: [
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
                isExpanded: true,
                value: from,
                hint: const Text('Nereden'),
                items: cities
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    to = value;
                  });
                },
                isExpanded: true,
                value: to,
                hint: const Text('Nereye'),
                items: cities
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: deviceWidth,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    addRoute();
                  },
                  child: Text(
                    "Rota Ekle",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addRoute() {
    if (_formKey.currentState!.validate()) {
      final route = FlightRoute(
        //routeId: TempDB.routeList.length + 1,
        routeName: '$from-$to',
        cityFrom: from!,
        cityTo: to!,
      );
      Provider.of<AppDataProvider>(context, listen: false).addRoute(route).then(
        (response) {
          {
            showMsg(context, "Rota Ekleme Başarılı");
          }
        },
      );
    }
  }

  void _getData() {
    Provider.of<AppDataProvider>(context, listen: false).getAllPlane();
    Provider.of<AppDataProvider>(context, listen: false).getAllFlightRoutes();
  }
}
