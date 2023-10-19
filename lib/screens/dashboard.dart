import 'package:coffeehouse/constants/color_palette.dart';
import 'package:coffeehouse/screens/Mccafe.dart';
import 'package:coffeehouse/screens/Nescafe.dart';
import 'package:coffeehouse/screens/black_gold.dart';
import 'package:coffeehouse/screens/cold_brew.dart';
import 'package:coffeehouse/screens/gold_brew.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette=ColorPalette();
  var _selectedOption=0;
  List allOptions=[
    BlackGold(),
    ColdBrew(),
    Nescafe(),
    McCaffee(),
    GoldBrew(),

  ];
  List isSelected=[ true,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenheight=MediaQuery.of(context).size.height;


    return Scaffold(
      body: Stack(
        children: [
          Container(
          height: screenheight,
          width: screenWidth,
          color: Colors.transparent,
          ),
          Container(
            height:screenheight,
            width: screenWidth/5,
            color: colorPalette.leftBarColor,
           
          ),
          Positioned(
            left: screenWidth/5,
            child: Container(
              height: screenheight,
              width: screenWidth-(screenWidth/5),
              color: Colors.white,

            )),
            Positioned(
              top: 35.0,
              left: 20.0,
              child: Icon(
                Feather.menu
              )),
               Positioned(
              top: 35.0,
              right: 20.0,
              child: Icon(
                Feather.shopping_bag
              )),
              Positioned(
                top: screenheight-(screenheight-100.0),
                left: (screenWidth/5)+25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CoffeeHouse',
                     style: TextStyle(
                          color: Color(0xFF23163D),
                          fontFamily: 'BigShouldersText',
                          
                          fontSize: 40.0),
                   
                    ),
                      Text('A lot can happen over coffee',
                     style: TextStyle(
                          color: Color(0xFFA59FB0),
                          fontFamily: 'BigShouldersText',
                          
                          fontSize: 15.0),
                   
                    ),
                    SizedBox(height: 20,),
                    Container(height: 40.0,
                    width: 225.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))
                        ),
                        contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                        hintText: 'Search ...',
                        hintStyle: TextStyle(
                           color: Color(0xFFA59FB0),
                          fontFamily: 'BigShouldersText',
                          fontSize: 15.0),
                          suffixIcon: Icon(Icons.search,
                          color: Colors.grey.withOpacity(0.4),)

                        ),

                      ),
                    ),


                   
                  ],
                ),
              ),
              buildSideNavigator(),
              
              Positioned(
                top: (screenheight/3.3)-10,
                left: (screenWidth/5)+25.0,
                child: Container(
                  height: screenheight-((screenheight/3)+50.0),
                  width: screenWidth-((screenWidth/5)+40.0),
                  child: allOptions[_selectedOption],
                ),
              )




        ],
      ),
    );
    
  }
  buildSideNavigator(){
    return Positioned(
      top: 75.0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height-100.0,
          height: MediaQuery.of(context).size.width/5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOption('Black Gold',0),
              buildOption('Cold Brew',1),
              buildOption('Nescafe ',2),
              buildOption('McCafe ',3),
              buildOption('Gold Brew ',4),
            ],
          ),
        ),
        ));
  }
  buildOption(String title ,int index){
    return Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
    isSelected[index]?Container(
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF23163D)

      ),
    ):Container(
        height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent

      ),
    ),
    SizedBox(height: 5.0,),
    GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption=index;
          isOptionSelected(index);
        });
      },
      child: Text(
        title,
         style:isSelected[index]? TextStyle(
                          color: Color(0xFF23163D),
                          fontFamily: 'BigShouldersText',
                          fontSize: 18.0):
                          TextStyle(
                          color: Color(0xFFA59FB0),
                          fontFamily: 'BigShouldersText',
                          fontSize: 17.0)
      ),
    )
    
   ],
    );
  }
  isOptionSelected(index){
    var previousIndex=isSelected.indexOf(true);
    isSelected[index]=true;
    isSelected[previousIndex]=false;

  }

}