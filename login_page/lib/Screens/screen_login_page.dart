import 'package:flutter/material.dart';
import 'package:login_page/Screens/screen_mai_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen_splash.dart';

class Data extends UserDataList {}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isdataMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(239, 255, 244, 195),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(224, 27, 27, 26),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(top: 40),
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/image/flutter-logo_drzj7u.png",
                    width: 80,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                // height: 300,
                width: 370,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(105, 36, 35, 35),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: userNameController,
                        cursorColor: Color.fromARGB(225, 22, 34, 00),
                        style: const TextStyle(
                          fontFamily: "Font1",
                          color: Color.fromARGB(225, 22, 34, 00),
                        ),
                        decoration: const InputDecoration(
                            fillColor: Color.fromARGB(238, 255, 255, 255),
                            filled: true,
                            label: Text("User ID"),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(225, 22, 34, 00),
                            ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'User Id  is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Color.fromARGB(225, 22, 34, 00),
                        style: const TextStyle(
                          fontFamily: "Font1",
                          color: Color.fromARGB(225, 22, 34, 00),
                        ),
                        decoration: const InputDecoration(
                            fillColor: Color.fromARGB(238, 255, 255, 255),
                            filled: true,
                            label: Text("Password"),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(225, 22, 34, 00),
                            ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: !_isdataMatch,
                              child: const Text(
                                "Username or Password does not match",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  validater(context);
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(225, 22, 34, 00),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  disappear() async {
    await Future.delayed(Duration(seconds: 6));
    setState(() {
      _isdataMatch = true;
    });
  }

  validater(BuildContext ctx) async {
    final _userName = userNameController.text;
    final _password = passwordController.text;

    var data = Data();

    if (_userName == data.userName && _password == data.password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.setBool(SAVE_KEY, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => LoggedPage())));
    } else {

      setState(() {
        _isdataMatch = false;
      });

      disappear();
    }
  }
}
