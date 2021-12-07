import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/shop_app/cubit/cubit.dart';
import 'package:softscope/layout/shop_app/cubit/states.dart';
import 'package:softscope/shared/components/conponents.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (context , state){
        return  ConditionalBuilder(
          condition: state is! ShopLoadingFavoritesDataState ,
          builder:  (context) =>  ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context , index) => buildListItem(ShopCubit.get(context).favoritesModel.data!.data![index].product , context) ,
            separatorBuilder: (context , index) => Divider() ,
            itemCount:ShopCubit.get(context).favoritesModel.data!.data!.length ,
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,

        );
      },
    );
  }

}
