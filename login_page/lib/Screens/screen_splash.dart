import 'package:flutter/material.dart';
import 'package:login_page/Screens/screen_login_page.dart';
import 'package:login_page/Screens/screen_mai_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY = 'User Logged In';

class UserDataList {
  final String userName = "hello";
  final String password = "123";
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loggedInChecker();

    // loginPageOpener();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(22, 22, 34, 00), 
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            'assets/image/flutter-logo_drzj7u.png',
            width: 130,
          ),
          const Text(
            "Loading . . .",
            style: TextStyle(
                color: Color.fromARGB(255, 138, 206, 226),
                fontWeight: FontWeight.w300,
                fontSize: 20),
          )
        ]),
      ),
    );
  }

  Future<void> loginPageOpener() async {
    Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return LoginPage();
    }));
  }

  Future<void> loggedInChecker() async {
    final _sharedPrefs = await SharedPreferences.getInstance(); 
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      loginPageOpener();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => LoggedPage()));
    }
  }
}
