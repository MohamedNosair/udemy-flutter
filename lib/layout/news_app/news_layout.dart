import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/news_app/cubit/cubit.dart';
import 'package:softscope/layout/news_app/cubit/states.dart';
import 'package:softscope/modules/news_app/search/search.dart';
import 'package:softscope/shared/components/conponents.dart';
import 'package:softscope/shared/cubit/cubit.dart';
import 'package:softscope/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              DioHelper.getData(
                  url:'v2/top-headlines' ,
                  query: {
                    'country':'eg',
                    'category':'sports',
                    'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
                  }).then((value)
              {
                print(value.data['articles'][0]['description']);
              }).catchError((error){
                print(error.toString());
              });
            },
            child: Icon(Icons.add),
          ) ,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
          ),
          body: cubit.Screen[cubit.currentIndex],
        );
      },
    );
  }
}
