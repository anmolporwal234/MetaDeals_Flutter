import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metadeals/GoogleAd/googleAd.dart';
import 'package:metadeals/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/login_screen.dart';


class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: const Text("Profile"),
    titleSpacing: 00.0,
    centerTitle: true,
    toolbarHeight: 60.2,
    toolbarOpacity: 0.8,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25)),
    ),
    elevation: 0.00,
    backgroundColor: Color(0xFF4C53A5),
    ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 150,
                child: Image.asset("assets/animation/profilescroll.gif", fit: BoxFit.contain),
              ),


              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                      fontSize: 20, fontWeight: FontWeight.bold
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                      fontSize: 20, fontWeight: FontWeight.bold
                  )),
              // Text("${loggedInUser.uid}",
              //     style: TextStyle(
              //       color: Colors.black54,
              //         fontSize: 20, fontWeight: FontWeight.bold
              //     )),
              Text("${loggedInUser.phoneNumber}",
                  style: TextStyle(
                    color: Colors.black54,
                      fontSize: 20, fontWeight: FontWeight.bold
                  )),
              Spacer(),




              ActionChip(
                  label: Text("Logout"),
                  onPressed: () async{

                    logout(context);
                  }),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
    sharedPrefrences.remove('email');
    await FirebaseAuth.instance.signOut();
     Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}


