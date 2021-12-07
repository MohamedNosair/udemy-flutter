import 'package:flutter/material.dart';
import 'package:softscope/models/user/user_model.dart';
class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1,
        name: 'Nosair',
        phone: '+201277890731',
    ),
    UserModel(id: 2,
      name: 'Mohamed',
      phone: '+202646670909',
    ),
    UserModel(id: 3,
      name: 'Ali',
      phone: '+2026463020829',
    ),
    UserModel(id: 4,
      name: 'Ahmed',
      phone: '+2021627676271627',
    ),
    UserModel(id: 1,
      name: 'Nosair',
      phone: '+201277890731',
    ),
    UserModel(id: 2,
      name: 'Mohamed',
      phone: '+202646670909',
    ),
    UserModel(id: 3,
      name: 'Ali',
      phone: '+2026463020829',
    ),
    UserModel(id: 4,
      name: 'Ahmed',
      phone: '+2021627676271627',
    ),
    UserModel(id: 1,
      name: 'Nosair',
      phone: '+201277890731',
    ),
    UserModel(id: 2,
      name: 'Mohamed',
      phone: '+202646670909',
    ),
    UserModel(id: 3,
      name: 'Ali',
      phone: '+2026463020829',
    ),
    UserModel(id: 4,
      name: 'Ahmed',
      phone: '+2021627676271627',
    ),
    UserModel(id: 1,
      name: 'Nosair',
      phone: '+201277890731',
    ),
    UserModel(id: 2,
      name: 'Mohamed',
      phone: '+202646670909',
    ),
    UserModel(id: 3,
      name: 'Ali',
      phone: '+2026463020829',
    ),
    UserModel(id: 4,
      name: 'Ahmed',
      phone: '+2021627676271627',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder:(context , index ) => buildUserItem(users[index]) ,
          separatorBuilder:(context , index ) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0 ,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0 ,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length ,
      ),
    );
  }

  Widget buildUserItem(UserModel User) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: Text(
            '${User.id}',
            style: TextStyle(
              fontSize: 25.0 ,
              fontWeight: FontWeight.bold ,
            ),
          ),
        ),
        SizedBox(
          width: 20.0 ,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${User.name}',
              style: TextStyle(
                fontSize: 25.0 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
            Text(
              '${User.phone}',
              style: TextStyle(
                color: Colors.grey ,
              ),
            ),
          ],
        ),
      ],
    ),
  );

}
