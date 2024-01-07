import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucak/drawers/main_drawer.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? fromCity, toCity;
  DateTime? departureDate;
  final _formKey = GlobalKey<FormState>();

  // ignore: unused_field
  late User? _user;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
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
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      drawer: check() ? MainDrawer() : null,
      appBar: check() ? AppBar(title: const Text('Admin')) : null,
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 30, right: 30),
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("assets/logo/logo.png"))),
              SizedBox(
                height: 80,
              ),
              DropdownButtonFormField<String>(
                //value: fromCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                hint: const Text('Nereden'),
                isExpanded: true,
                items: cities
                    .map((city) => DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  fromCity = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                //value: toCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bosField;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                hint: const Text('Nereye'),
                isExpanded: true,
                items: cities
                    .map((city) => DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  toCity = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _selectDate,
                      child: const Text(
                        'Kalkış tarihi seçin',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(departureDate == null
                        ? 'Tarih seçilmedi'
                        : getFormattedDate(departureDate!,
                            pattern: 'EEE MMM dd, yyyy')),
                  ],
                ),
              ),
              SizedBox(
                width: deviceWidth,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    _search();
                  },
                  child: Text(
                    "Yolculuk Ara",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
    );
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  }

  bool check() {
    if (_user!.email == "caglar@gmail.com") {
      return true;
    }
    return false;
  }

  void _search() {
    if (departureDate == null) {
      showMsg(context, "Lütfen Tarih Seçiniz");
      return;
    }
    if (_formKey.currentState!.validate()) {
      Provider.of<AppDataProvider>(context, listen: false)
          .getRouteByCityFromAndCityTo(fromCity!, toCity!)
          .then((route) {
        if (route != null) {
          Navigator.pushNamed(context, "seferler",
              arguments: [route, getFormattedDate(departureDate!)]);
        } else {
          showMsg(context, "Rota bulunamadı. Lütfen önce rota seçin");
        }
      });
    }
  }
}
