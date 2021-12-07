import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/news_app/cubit/cubit.dart';
import 'package:softscope/layout/news_app/cubit/states.dart';
import 'package:softscope/shared/components/conponents.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: ( context, state) {
        var list = NewsCubit.get(context).science;
        return articleBuilder(list , context);
      },

    );
  }
}