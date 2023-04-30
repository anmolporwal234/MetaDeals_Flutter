import 'package:flutter/cupertino.dart';

class CategeriosWidget extends StatelessWidget {
  const CategeriosWidget({Key? key}) : super(key: key);
  void main() {
    var list = [2, 4, 8, 16, 32];
    var element = list.elementAt(3);
    print('Element :  $element');
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1 ; i<8;i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5 ,horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset("images/$i.png",height: 40,width: 40,),
                const Text("Shoes"
                ,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),

                    ))

              ],
            ),
          ),

        ],
      ),
    )
    ;
  }
}
