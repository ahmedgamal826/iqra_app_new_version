import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key, required this.suraJsonData});

  var suraJsonData;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => HomePageAppApp(
                    suraJsonData: widget.suraJsonData,
                  )));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/iqra_logo.png'),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
