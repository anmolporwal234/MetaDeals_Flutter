import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metadeals/constants.dart';

import 'package:metadeals/components_homepage/categories.dart';
import 'package:metadeals/components_homepage/new_arrival_products.dart';
import 'package:metadeals/components_homepage/popular_products.dart';
import 'package:metadeals/components_homepage/search_form.dart';

import '../GoogleAd/googleAd.dart';
import '../Widgets/NavigationDrawerWidget.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ConfettiController(duration: const Duration(seconds: 5));
  @override
  void initState() {
    super.initState();
    controller.play();

  }

  Widget build(BuildContext context) {
    return Stack(
      children: [Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigationDrawerWidget()));
            },
            icon: SvgPicture.asset("assets/icons/menu.svg"),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(width: defaultPadding / 2),
              Text(
                "MetaDeals",
                style: TextStyle(
                  fontSize:23,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.ad_units, size: 25,
                color: Color(0xFF000000),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleAdScreen()));
              },
            ),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                },
                icon: Icon(Icons.logout, size: 25,
                  color: Color(0xFF000000),)),
          ],

        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find Your Style",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize:28,fontWeight: FontWeight.w500, color: Colors.black),
              ),
              // const Text(
              //   "Explore",
              //   style: TextStyle(fontSize: 18),
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: SearchForm(),


              ),
              const Categories(),
              const NewArrivalProducts(),
              const PopularProducts(),
            ],
          ),
        ),
      ),
        ConfettiWidget(confettiController: controller,
          shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,

          // blastDirection: pi/2 ,
          emissionFrequency: 0.2 ,
          numberOfParticles: 10,
        ),

      ],

    );
  }
}

