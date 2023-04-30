import 'package:lottie/lottie.dart';
import 'package:metadeals/FingerPrintAuth/biometricPinAuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:local_auth_platform_interface/types/biometric_type.dart';

import 'package:metadeals/Pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Pages/login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}
Future<void> main() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var email = sharedPreferences.getString('email');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? LoginScreen(): HomePage()
  ));
}



class _AuthPageState extends State<AuthPage> {
  Future<void> _checkDeviceSupport() async {

    bool isSupport = await BiometricPinAuthService.checkDeviceAuthSupport();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Device Auth Support"),
              content: isSupport
                  ? const Text("Device Supported")
                  : const Text("Device Not Supported"));
        });
  }

  void goToNextPage() async {
    bool authStatus = await BiometricPinAuthService.authenticateBioMetrics();

    if (authStatus) {
     // Navigator.pushNamed(context,  "/LoginPage" );
      main();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                title: Text(" Auth SuccessStatus"),
                content: Text(
                  "Incorrect FingerPrint",
                  style: TextStyle(color: Colors.red),
                ));
          });
    }
  }

void Language() async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),

          title: Text('Language'),

          actions: [
            // IconButton(
            //   icon: Image.asset('path/the_image.png'),
            //   iconSize: 50,
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: Image.asset('assets/animation/language.gif'),
            //   iconSize: 50,
            //   onPressed: () {},
            // ),
            Text(
              'ENGLISH',
            ),
            Text(
             'HINDI',
            )
          ],
        ),
      );
    },
  );

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Row(
               mainAxisAlignment: MainAxisAlignment.end,

                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/animation/language.gif'),
                    iconSize: 50,
                    onPressed: () {
                      Language();
                    },
                  ),

                ]),
            Spacer(),
            Spacer(),
            Image.asset('assets/animation/welcomeanimation.gif',
              width: 300,
              height: 300,
            ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 40,
                padding : const EdgeInsets.symmetric(horizontal: 60 ,vertical: 10),
                primary: Color(0xFF4C53A5),
                textStyle: const TextStyle( fontSize: 20 , fontWeight: FontWeight.bold),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30))
              ),

                onPressed: () {
                  goToNextPage();

                },
                child: const Text("Welcome")),
           Spacer(),


          ],
        ),
      ),
    );
  }
}
