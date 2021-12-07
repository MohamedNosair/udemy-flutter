import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {

    // main axis alignment : start
    // cross axis alignment : center
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.menu),
        title: Text('Home'),
        actions:   
        [
         IconButton(
             icon:Icon(Icons.notification_important),
             onPressed: onNotification ,
         ),
          IconButton(
              icon:Icon(Icons.search),
            onPressed: onNotification ,
            autofocus: true,
          ),

          // widget(
          //   child: Icon(
          //       Icons.search,
          //   ),
          // ),


        ],

      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(

          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20.0),
                    bottomStart: Radius.circular(20.0),

                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter ,
                  children:
                  [
                    Image(
                      image: NetworkImage(
                        'https://st.depositphotos.com/1787196/1330/i/600/depositphotos_13301967-stock-photo-furry-blue-monster.jpg' ,

                      ),
                      height: 200.0 ,
                      width: 200.0 ,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 200.0,
                      color: Colors.blueAccent.withOpacity(0.5),
                      padding:EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Text(
                        'Nosair',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0 ,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onNotification(){
    print('hello');
  }
}