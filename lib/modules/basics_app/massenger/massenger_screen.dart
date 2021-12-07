import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MassengerScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0 ,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0 ,
              backgroundImage: NetworkImage('https://image.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg'),
            ),
            SizedBox(
              width: 15.0 ,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black ,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon:CircleAvatar(
                radius: 15.0,
                child: Icon(
                Icons.camera_alt ,
                  color: Colors.white,
                ),
              ),
              onPressed: (){}
              ),
          IconButton(
              icon:CircleAvatar(
                radius: 15.0,
                child: Icon(
                  Icons.edit ,
                  color: Colors.white,
                ),
              ),
              onPressed: (){}
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Start Search Box
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(5.0) ,
                child: Row(
                  children: [
                    Icon(
                        Icons.search ,
                    ),
                    SizedBox(
                      width: 15.0 ,
                    ),
                    Text(
                      'Search' ,
                    ),

                  ],
                ),
              ),
              /// End Search Box
              /// Start Space
              SizedBox(
                height: 20.0 ,
              ),
              /// End Space
              Container(
                height: 100.0 ,
                child: ListView.separated(
                  shrinkWrap: true ,
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context , index) => buildStoryItem(),
                  separatorBuilder: (context , index ) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 19 ,
                ),
              ),

              SizedBox(
                height: 10.0 ,
              ),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true ,
                itemBuilder:(context , index ) => buildChatItem() ,
                separatorBuilder: (context , index ) => SizedBox(
                  height: 20.0 ,
                ),
                itemCount: 15 ,
              ),

            ],
          ),
        ),
      ),
    );
  }

  /// 1. build item
  /// 2. build list
  /// 3. add item to list

 Widget buildChatItem() => Row(
   children: [
     Stack(
       alignment:AlignmentDirectional.bottomEnd,
       children: [
         CircleAvatar(
           radius: 30.0 ,
           backgroundImage: NetworkImage('https://image.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg'),

         ),
         CircleAvatar(
           radius: 9.0 ,
           backgroundColor: Colors.white,
         ),
         Padding(
           padding: const EdgeInsetsDirectional.only(
             bottom: 2.0 ,
             end: 2.0 ,
           ),
           child: CircleAvatar(
             radius: 7.0 ,
             backgroundColor: Colors.green,
           ),
         ),
       ],
     ),
     SizedBox(
       width : 10.0 ,
     ),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'Mohamed Nosair',
             style: TextStyle(
               fontSize: 16.0 ,
               fontWeight: FontWeight.bold ,
             ),
             maxLines: 1 ,
             overflow:TextOverflow.ellipsis ,
           ),
           SizedBox(
             height: 5.0,
           ),
           Row(
             children: [
               Expanded(
                 child: Text(
                   'Welcome To Mohamed Nosair' ,
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                     fontSize: 12.0 ,
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:10.0),
                 child: Container(
                   width: 7.0,
                   height:7.0,
                   decoration: BoxDecoration(
                     color: Colors.green ,
                     shape: BoxShape.circle ,
                   ),
                 ),
               ),
               Text(
                 '02:23 Pm',
               ),
             ],
           ),
         ],
       ),
     ),
   ],
 );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment:AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0 ,
              backgroundImage: NetworkImage('https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),

            ),
            CircleAvatar(
              radius: 9.0 ,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0 ,
                end: 2.0 ,
              ),
              child: CircleAvatar(
                radius: 7.0 ,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0 ,
        ),
        Text(
          'Abdullah Eid',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
