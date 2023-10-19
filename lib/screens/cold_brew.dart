import 'package:coffeehouse/constants/color_palette.dart';
import 'package:coffeehouse/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ColdBrew extends StatefulWidget {
  const ColdBrew({Key? key}) : super(key: key);

  @override
  State<ColdBrew> createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
        return ListView(
          children: [
            buildListItem('assets/img/coffee4.png','150',ColorPalette().secondSlice),
            buildListItem('assets/img/coffee2.png','200',ColorPalette().firstSlice)
          ],
        );
    
  }
  buildListItem(String imgPath , String price ,Color bgColor){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>CoffeeDetails(imgPath: imgPath,headerColor: bgColor,)

        ));
        
      },
      child: Stack(
        children: [
          Container(
            height: 300.0,
            width: 250.0,
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.transparent
            ),
          ),
          Positioned(
            top: 100.0,
          child: Container(
            height: 180,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage('assets/img/doodle.png'),
                fit: BoxFit.cover

              )
            ),
          ),),
           Positioned(top: 100.0,
          child: Container(
            height: 200,
            width: 350.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
             color: Colors.white.withOpacity(0.6)
            ),
          ),),
           Positioned(top: 100.0,
          child: Container(
            height: 200,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
             color: bgColor.withOpacity(0.9)
            ),
          ),),
          Positioned(
            right: 20.0,
       child: 
       Hero(
        tag: imgPath, 
        child: Container(
        height: 225.0,
        width: 150.0,
        child: Image(image: AssetImage(imgPath),fit: BoxFit.scaleDown,),

        

       )),
            ),
            Positioned(top: 125.0,
            left:15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price', style: TextStyle(
                          color: Color(0xFF23163D),
                          fontFamily: 'BigShouldersText',
                          fontSize: 20.0)),
               Text('\$'+price, style: TextStyle(
                          color:Colors.white,
                          fontFamily: 'BigShouldersText',
                          fontSize: 40.0)),
                          SizedBox(height: 20.0,),
             Text('Grady\'s COLD BREW', style: TextStyle(
                          color: Color(0xFF23163D),
                          fontFamily: 'BigShouldersText',
                          fontSize: 27.0)),
                             SizedBox(height: 2.0,),
                             Container(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                          Text('65 reviews', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'BigShouldersText',
                              fontSize: 15.0)),
                             SizedBox(height: 2.0,),
                              SmoothStarRating(

                                starCount: 5,
                                size: 15.0,
                                color: Colors.white,
                                borderColor: Colors.white,
                                rating:3,
                              )

                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(width: 75.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,size: 17.0,),
                                      SizedBox( width: 5.0,),
                                      Text('Add', style: TextStyle(
                                              color: Color(0xFF23163D),
                                              fontFamily: 'BigShouldersText',
                                              fontSize: 15.0)),
                                                        ],

                                  )
                                  )
                                )
                                ],
                              ),
                             ),
              ],
            ),
            )
        ],
      )
    );

  }
}