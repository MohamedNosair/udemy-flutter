import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:softscope/layout/social_app/cubit/cubit.dart';
import 'package:softscope/layout/social_app/cubit/states.dart';
import 'package:softscope/modules/social_app/new_post/new_post_screen.dart';
import 'package:softscope/modules/social_app/notifications/notifications_screen.dart';
import 'package:softscope/modules/social_app/search/search_screen.dart';
import 'package:softscope/shared/components/conponents.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState)
        {
          navigateTo( context , NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  IconlyBroken.notification,
                ),
                onPressed: () {
                  navigateTo(context, NotificationsScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  IconlyBroken.search,
                ),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
         // bottomNavigationBar: BottomAppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.chat,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.plus,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.location,
                  ),
                  label: 'User'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.setting,
                  ),
                  label: 'Setting'),
            ],
          ),
        );
      },
    );
  }
}

/// IconlyBroken
/// IconlyBroken
/// IconlyBroken
