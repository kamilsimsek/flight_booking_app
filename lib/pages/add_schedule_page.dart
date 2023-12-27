import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../datasource/temp_db.dart';

import '../providers/app_data_provider.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({Key? key}) : super(key: key);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  String? busType;
  FlightRoute? flightRoute;
  Plane? plane;
  TimeOfDay? timeOfDay;
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final feeController = TextEditingController();

  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Schedule'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            shrinkWrap: true,
            children: [
              Consumer<AppDataProvider>(
                builder: (context, provider, child) =>
                    DropdownButtonFormField<Plane>(
                  onChanged: (value) {
                    setState(() {
                      plane = value;
                    });
                  },
                  isExpanded: true,
                  value: plane,
                  hint: const Text('Select Bus'),
                  items: provider.planeList
                      .map((e) => DropdownMenuItem<Plane>(
                            value: e,
                            child: Text('${e.planeName}-${e.planeType}'),
                          ))
                      .toList(),
                ),
              ),
              Consumer<AppDataProvider>(
                builder: (context, provider, child) =>
                    DropdownButtonFormField<FlightRoute>(
                  onChanged: (value) {
                    setState(() {
                      flightRoute = value;
                    });
                  },
                  isExpanded: true,
                  value: flightRoute,
                  hint: const Text('Select Route'),
                  items: provider.routeList
                      .map((e) => DropdownMenuItem<FlightRoute>(
                            value: e,
                            child: Text(e.routeName),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Ticket Price',
                  filled: true,
                  prefixIcon: Icon(Icons.price_change),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: discountController,
                decoration: const InputDecoration(
                  hintText: 'Discount(%)',
                  filled: true,
                  prefixIcon: Icon(Icons.discount),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: feeController,
                decoration: const InputDecoration(
                  hintText: 'Processing Fee',
                  filled: true,
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _selectTime,
                    child: const Text('Select Departure Time'),
                  ),
                  Text(timeOfDay == null
                      ? 'No time chosen'
                      : getFormattedTime(timeOfDay!)),
                ],
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: addSchedule,
                    child: const Text('ADD Schedule'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addSchedule() {
    if (timeOfDay == null) {
      showMsg(context, 'Please select a departure date');
      return;
    }
    if (_formKey.currentState!.validate()) {
      final schedule = FlightSchedule(
        scheduleId: TempDB.flightReservationList.length + 1,
        plane: plane!,
        flightRoute: flightRoute!,
        departureTime: getFormattedTime(timeOfDay!),
        ticketPrice: int.parse(priceController.text),
        discount: int.parse(discountController.text),
        processingFee: int.parse(feeController.text),
      );

      Provider.of<AppDataProvider>(context, listen: false)
          .addSchedule(schedule)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          showMsg(context, response.message);
          resetFields();
        }
      });
    }
  }

  void _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        timeOfDay = time;
      });
    }
  }

  void resetFields() {
    priceController.clear();
    discountController.clear();
    feeController.clear();
  }

  void _getData() {
    Provider.of<AppDataProvider>(context, listen: false).getAllPlane();
    Provider.of<AppDataProvider>(context, listen: false).getAllPlaneRoutes();
  }
}
