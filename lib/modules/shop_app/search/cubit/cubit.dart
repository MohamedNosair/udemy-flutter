import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/models/shop_app/search_model.dart';
import 'package:softscope/modules/shop_app/search/cubit/state.dart';
import 'package:softscope/shared/components/constants.dart';
import 'package:softscope/shared/network/end_points.dart';
import 'package:softscope/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  late SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token ,
      data:{
        'text': text,
      },
    ).then((value){

      model = SearchModel.fromJson(value.data);

      print(value.data.toString());

      emit(SearchSuccessState());

    }).catchError((error){

      print(error.toString());

      emit(SearchErrorState());
    });
  }
}
