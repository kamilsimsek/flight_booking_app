import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucak/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:ucak/utils/helper_functions.dart';

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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage("assets/logo/logo.png"))),
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
                    validator: (value) =>
                        validateEmail(email: mailController.text),
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
                    validator: (value) =>
                        validatePassword(password: sifreController.text),
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
                        _confirmGirisYap();
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

  void _confirmGirisYap() {
    if (_formKey.currentState!.validate()) {
      signIn();
    }
  }

  void resetFields() {
    mailController.clear();
    sifreController.clear();
  }

  void signIn() async {
    User? user = await AuthService()
        .signIn(email: mailController.text, password: sifreController.text);
    if (user != null) {
      Navigator.pushNamed(context, "search");
    } else
      showMsg(context, "Mail veya Sifre Hatali");
  }
}
