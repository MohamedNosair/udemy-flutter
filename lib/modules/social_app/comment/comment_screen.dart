import 'package:flutter/material.dart';
import 'package:softscope/shared/components/conponents.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: 'comment' ,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://image.freepik.com/free-photo/praying-ethnic-woman-raises-clenched-fists-rejoices-victory-satisfied-with-good-result-work-wears-pink-hijab-dressed-white-shirt-isolated-blue-wall-hand-gesture-happiness_273609-26348.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Text(
                'Mohamed Nosair',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 1.4,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
