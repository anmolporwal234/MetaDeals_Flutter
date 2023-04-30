
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metadeals/Widgets/HomeAppBar.dart';
import 'package:metadeals/Widgets/speechtotext.dart';

import '../Widgets/CategoriesWidget.dart';
import '../Widgets/NavigationDrawerWidget.dart';
import '../Widgets/itemwidget.dart';
import '../main.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop ,
      child: Scaffold(


        body:

          ListView(
            children: [






                HomeAppBar(),

                    Container(
                      //height: 1000,
                      padding: EdgeInsets.only(top:15),
                      decoration: const BoxDecoration(
                          color: Color(0xACC1AFAF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),

                          )
                      ),
                      child: Column(children: [

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(30),


                            ),
                            child : Row(
                              children: [
                                Container(margin: EdgeInsets.only(left: 5),
                                  height: 50,
                                  width: 200,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Search Here"
                                    ),
                                  )
                                  ,),
                                Spacer(),
                                IconButton( onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SpeechScreen()));
                                }, icon: Icon(Icons.mic, size: 20,
                                  color: Color(0xFF4C53A5),))
                                /*const Icon(

                                  Icons.mic,
                                  size: 27,
                                  color: Color(0xFF4C53A5),
                                )*/
                              ],
                            )
                        ),
                    //     Container(
                    //       alignment: Alignment.centerLeft,
                    //       margin: const EdgeInsets.symmetric(
                    //         vertical: 20,
                    //         horizontal: 10,
                    //
                    //       ),
                    //       child: const Text("Categories" , style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //         color: Color(0xFF4C53A5),
                    //       ),
                    //       ),
                    //     ),
                    //     // CategeriosWidget(),
                    //
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    //   child: Text(
                    //     "Trending Product",
                    //         style: TextStyle(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xFF4C53A5)
                    //         )
                    //   ),
                    // ),
                    //     ItemWidget(),


                      ],
                      ),
                    ),






            ],











      ),

      ),

    );
  }
}
