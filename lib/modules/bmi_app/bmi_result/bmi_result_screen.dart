import 'package:flutter/material.dart';

class bmiResultScreen extends StatelessWidget
{
 final  int result ;
 final int age ;
 final bool isMale ;

 bmiResultScreen({
 required this.result ,
 required this.age ,
 required this.isMale ,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
              'Bmi Result ' ,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female' }',
              style: TextStyle(
                fontSize: 25.0 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
            Text(
              'Result : $result ' ,
              style: TextStyle(
                fontSize: 25.0 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
            Text(
              'Age : $age' ,
              style: TextStyle(
                fontSize: 25.0 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

