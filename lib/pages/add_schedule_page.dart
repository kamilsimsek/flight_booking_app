import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({Key? key}) : super(key: key);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  String? busType;
  bool _dataFetched = false;
  FlightRoute? flightRoute;
  Plane? plane;
  TimeOfDay? timeOfDay;
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final feeController = TextEditingController();

  @override
  void didChangeDependencies() {
    _getData();
    _dataFetched = true;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Güzergah Ekle'),
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
                  hint: const Text('Uçak Seç'),
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
                      print('length:' + provider.routeList.length.toString());
                    });
                  },
                  isExpanded: true,
                  value: flightRoute,
                  hint: const Text('Rota Seç'),
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
                decoration: InputDecoration(
                  hintText: 'Bilet Fiyatı',
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                decoration: InputDecoration(
                  hintText: 'İndirim (%)',
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                decoration: InputDecoration(
                  hintText: 'Vergi',
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                    child: const Text('Kalkış Saati Seçin'),
                  ),
                  Text(timeOfDay == null
                      ? 'Saat Seçilmedi'
                      : getFormattedTime(timeOfDay!)),
                ],
              ),
              SizedBox(
                width: deviceWidth,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    addSchedule();
                  },
                  child: Text(
                    "Güzergah Ekle",
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

  void addSchedule() {
    if (timeOfDay == null) {
      showMsg(context, 'Lütfen Kalkış Saati Seçin');
      return;
    }
    if (_formKey.currentState!.validate()) {
      final schedule = FlightSchedule(
        //scheduleId: TempDB.tableSchedule.length + 1,
        plane: plane!,
        flightRoute: flightRoute!,
        departureTime: getFormattedTime(timeOfDay!),
        ticketPrice: 100,
        discount: 0,
        processingFee: 10,
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addSchedule(schedule)
          .then(
        (response) {
          {
            showMsg(context, "Güzergah Ekleme Başarılı");
            //resetFields();
          }
        },
      );
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
    if (!_dataFetched) {
      Provider.of<AppDataProvider>(context, listen: false).getAllPlane();
      Provider.of<AppDataProvider>(context, listen: false).getAllFlightRoutes();
    }

    print('data çekti..................');
  }
}
