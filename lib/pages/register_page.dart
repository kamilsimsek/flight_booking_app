import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/user.dart';
import 'package:ucak/providers/app_data_provider.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  User? user;
  final adController = TextEditingController();
  final mailController = TextEditingController();
  final sifreController = TextEditingController();
  final sifreController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceHeight = mediaQueryData.size.height;
    final double deviceWidth = mediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(image: AssetImage("assets/logo/logoo.png"))),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: adController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      filled: true,
                      hintText: "Ad",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return bosField;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: mailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      filled: true,
                      hintText: "Mail",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return bosField;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: sifreController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Şifre",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return bosField;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: sifreController2,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Şifre",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return bosField;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: deviceWidth,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        _sifreKontrol() ? _confirmGirisYap() : null;
                      },
                      child: Text(
                        "ÜYE OL",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                /*Consumer<AppDataProvider>(
                  builder: (context, provider, child) =>
                      DropdownButtonFormField<User>(
                    onChanged: (value) {
                      setState(() {
                        user = value;
                      });
                    },
                    isExpanded: true,
                    value: user,
                    hint: const Text('Select Bus'),
                    items: provider.userList
                        .map((e) => DropdownMenuItem<User>(
                              value: e,
                              child: Text('${e.name}'),
                            ))
                        .toList(),
                  ),
                ),*/
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Zaten Üye misin?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _sifreKontrol() {
    if (sifreController.text == sifreController2.text) {
      return true;
    } else {
      showMsg(context, "Sifreler eslesmiyor");
      return false;
    }
  }

  void _confirmGirisYap() {
    if (_formKey.currentState!.validate()) {
      final user = User(
          id: TempDB.userList.length + 1,
          name: adController.text,
          mail: mailController.text,
          password: sifreController.text,
          role: "user");
      Provider.of<AppDataProvider>(context, listen: false).addUser(user);
      resetFields();

      Navigator.pushNamed(context, "login");
    }
  }

  void resetFields() {
    adController.clear();
    mailController.clear();
    sifreController.clear();
    sifreController2.clear();
  }

  void _getData() {
    Provider.of<AppDataProvider>(context, listen: false).getAllUser();
  }
}
