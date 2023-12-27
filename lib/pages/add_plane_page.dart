import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

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
  @override
  Widget build(BuildContext context) {
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a Plane Type';
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
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Bus Name',
                  filled: true,
                  prefixIcon: Icon(Icons.bus_alert),
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
                controller: numberController,
                decoration: const InputDecoration(
                  hintText: 'Bus Number',
                  filled: true,
                  prefixIcon: Icon(Icons.bus_alert),
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
                controller: seatController,
                decoration: const InputDecoration(
                  hintText: 'Total Seats',
                  filled: true,
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
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: addPlane,
                    child: const Text('ADD BUS'),
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
          planeId: TempDB.planeList.length + 1,
          planeName: nameController.text,
          planeNumber: numberController.text,
          planeType: planeType!,
          totalSeat: int.parse(seatController.text));
      /*final bus = Bus(
        busId: TempDB.tableBus.length +
            1, // remove this line if you save into MySql DB
        busName: nameController.text,
        busNumber: numberController.text,
        busType: busType!,
        totalSeat: int.parse(seatController.text),
      );*/
      Provider.of<AppDataProvider>(context, listen: false)
          .addPlane(plane)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          showMsg(context, response.message);
          resetFields();
        }
      });
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
}
