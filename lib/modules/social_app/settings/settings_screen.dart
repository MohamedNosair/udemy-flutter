import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:softscope/layout/social_app/cubit/cubit.dart';
import 'package:softscope/layout/social_app/cubit/states.dart';
import 'package:softscope/modules/social_app/edit_profile/edit_profile.dart';
import 'package:softscope/shared/components/conponents.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit
            .get(context)
            .userModel;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 220.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${userModel.image}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      CircleAvatar(
                        radius: 65,
                        backgroundColor:
                        Theme
                            .of(context)
                            .scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 63.0,
                          backgroundImage: NetworkImage('${userModel.cover}'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '${userModel.name}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                  ),
                ),
                Text(
                  '${userModel.bio}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '110',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Post',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '10k',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Photos',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '50k',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Followers',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '112',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Frieds',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Add photo',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        navigateTo(
                          context,
                          EditProfileScreen(),
                        );
                      },
                      child: Icon(
                        IconlyBroken.edit,
                        size: 20.0,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        FirebaseMessaging.instance.subscribeToTopic(
                            'subscribe');
                      },
                      child: Text('subscribe'),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        FirebaseMessaging.instance.unsubscribeFromTopic(
                            'subscribe');
                      },
                      child: Text('unsubscribe'),

                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
