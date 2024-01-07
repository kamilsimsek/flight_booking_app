import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addPlanePage extends StatefulWidget {
  const addPlanePage({Key? key}) : super(key: key);

  @override
  State<addPlanePage> createState() => _addPlanePageState();
}

class _addPlanePageState extends State<addPlanePage> {
  final _formKey = GlobalKey<FormState>();
  String? planeType;
  final seatController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  Plane? plane;
  FlightRoute? flightRoute;

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
        title: const Text('Uçak Ekle'),
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
                    planeType = value;
                  });
                },
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen Uçak Türünü Seçiniz';
                  }
                },
                decoration: InputDecoration(
                    errorStyle: const TextStyle(color: Colors.white)),
                isExpanded: true,
                value: planeType,
                hint: const Text('Uçak Türü Seçin'),
                items: planeTypes
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Uçak İsmi',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.flight),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  hintText: 'Uçak No',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.flight),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: seatController,
                decoration: InputDecoration(
                  hintText: 'Toplam Koltuk Sayısı',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.event_seat),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: deviceWidth,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    addPlane();
                  },
                  child: Text(
                    "Uçak Kaydet",
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

  void addPlane() {
    if (_formKey.currentState!.validate()) {
      final plane = Plane(
          //planeId: TempDB.planeList.length + 1,
          planeName: nameController.text,
          planeNumber: numberController.text,
          planeType: planeType!,
          totalSeat: int.parse(seatController.text));
      Provider.of<AppDataProvider>(context, listen: false).addPlane(plane).then(
        (response) {
          {
            showMsg(context, "Uçak Ekleme Başarılı");
            resetFields();
          }
        },
      );
    }
  }

  void resetFields() {
    numberController.clear();
    seatController.clear();
    nameController.clear();
  }

  @override
  void dispose() {
    seatController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  void _getData() {
    Provider.of<AppDataProvider>(context, listen: false).getAllPlane();
    Provider.of<AppDataProvider>(context, listen: false).getAllFlightRoutes();
  }
}
