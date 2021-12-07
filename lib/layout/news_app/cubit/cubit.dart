import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/news_app/cubit/states.dart';
import 'package:softscope/modules/news_app/business/business_screen.dart';
import 'package:softscope/modules/news_app/science/science_screen.dart';
import 'package:softscope/modules/news_app/sports/sports_screen.dart';
import 'package:softscope/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  // ignore: non_constant_identifier_names
  List<Widget> Screen =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
          Icons.business
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
    
      icon: Icon(
          Icons.sports
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 1 ) getSports();
    if(index == 2 ) getScience();

    emit(NewsBottomNavState());
  }


  List<dynamic> business = [];
  void getBusiness()
  {

    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }).then((value)
    {
      business = value.data['articles'];


      print(value.data['articles'][0]['description']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }



    List<dynamic> sports = [];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0)
    {
      DioHelper.getData(
          url:'v2/top-headlines' ,
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
          }).then((value)
      {
        sports = value.data['articles'];

        print(value.data['articles'][0]['description']);
        emit(NewsGetSportsSuccessState());

      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else
      {
        emit(NewsGetSportsSuccessState());
      }

  }

    List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());


    if(science.length == 0 )
    {
      DioHelper.getData(
          url:'v2/top-headlines' ,
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
          }


          ).then((value)
      {
        science = value.data['articles'];


        print(value.data['articles'][0]['description']);
        emit(NewsGetScienceSuccessState());

      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else
      {
        emit(NewsGetScienceSuccessState());
      }

  }

 List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url:'v2/everything' ,
        query: {
          'q': '$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }


    ).then((value)
    {
      search = value.data['articles'];

      print(search[0]['description']);

      emit(NewsGetSearchSuccessState());

    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });


  }


}
///  https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca


