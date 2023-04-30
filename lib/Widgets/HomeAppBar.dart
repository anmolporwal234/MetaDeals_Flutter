import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:metadeals/GoogleAd/googleAd.dart';
import 'package:metadeals/Pages/home_screen.dart';
import 'package:metadeals/Widgets/NavigationDrawerWidget.dart';
class HomeAppBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),

      child: Row(

        children: [

          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigationDrawerWidget()));
              },
              icon: Icon(Icons.sort, size: 30,
                color: Color(0xFF4C58A5),)),

     const Padding(padding: EdgeInsets.only(left: 20),
     child: Text("MetaDeals",
     style: TextStyle(
       fontSize:23,
       fontWeight: FontWeight.bold,
       color: Color(0xFF4C53A5),
     ),)
       ,),
          Spacer(),

          const Icon(

            Icons.wallet,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
         Spacer(),
          Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: const Text(
              "3",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
            child: InkWell(
              onTap: (){},
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFF4C53A5),

              ),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              icon: Icon(Icons.logout, size: 30,
                color: Color(0xFF4C53A5),)),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleAdScreen()));
              },
              icon: Icon(Icons.ad_units, size: 30,
                color: Color(0xFF4C53A5),)),
      ],

    ),
    );
  }
}
