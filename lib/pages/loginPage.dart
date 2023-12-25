import 'package:ucak/utils/constants.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final adController = TextEditingController();
  final mailController = TextEditingController();
  final sifreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceHeight = mediaQueryData.size.height;
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(image: AssetImage("assets/logo/logoo.png"))),
                SizedBox(
                  height: 45,
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
                  height: 35,
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
                        Navigator.pushNamed(context, "search");
                      },
                      child: Text(
                        "GİRİŞ YAP",
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Üye değil misin?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "register");
                        },
                        child: Text(
                          "Üye Ol",
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

  void _userKontrol() {}
}
