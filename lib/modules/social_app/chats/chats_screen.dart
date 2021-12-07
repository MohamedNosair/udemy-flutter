import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/social_app/cubit/cubit.dart';
import 'package:softscope/layout/social_app/cubit/states.dart';
import 'package:softscope/models/social_app/social_user_model.dart';
import 'package:softscope/modules/social_app/chat_details/chat_details.dart';
import 'package:softscope/shared/components/conponents.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder: (context , state){
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0 ,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context , index ) => buildChatItem(SocialCubit.get(context).users[index] , context ),
            separatorBuilder: (context , index ) => myDivider(),
            itemCount: SocialCubit.get(context).users.length,
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },
    );
  }


  Widget buildChatItem(SocialUserModel model , context) => InkWell(
    onTap: ()
    {
      navigateTo(context, ChatDetailsScreen(userModel: model,));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
               '${model.cover}',
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            '${model.name}',
            style: TextStyle(
              height: 1.4 ,
            ),

          ),
        ],
      ),
    ),
  );
}
