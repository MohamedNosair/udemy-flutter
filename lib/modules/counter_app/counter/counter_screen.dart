import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/modules/counter_app/cubit/cubit.dart';
import 'package:softscope/modules/counter_app/cubit/states.dart';


// ignore: must_be_immutable
class CounterScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      // ignore: missing_required_param
      child: BlocConsumer< CounterCubit , CounterStates>(
     listener: (context , state){
       if(state is CounterInitialState)print('InitialState}');
       if(state is CounterPlusState)print('PlusState${state.counter}');
       if(state is CounterMinusState)print('MinusState${state.counter}');
     },
        builder: (context , state){
       return Scaffold(
         appBar: AppBar(
           title: Text(
             'Counter',
           ),
         ),
         body: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextButton(
                 onPressed:()
                 {
                  CounterCubit.get(context).Minus();
                   print( CounterCubit.get(context));
                 },
                 child:Text(
                     'Minus'
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 20.0 ,
                 ),
                 child: Text(
                   '${CounterCubit.get(context).counter}',
                   style: TextStyle(
                     fontWeight: FontWeight.w700 ,
                     fontSize: 50.0 ,
                   ),
                 ),
               ),
               TextButton(
                 onPressed:()
                 {
                   CounterCubit.get(context).Plus();
                   print( CounterCubit.get(context));
                 },
                 child:Text(
                     'Plus'
                 ),
               ),
             ],
           ),
         ),
       );
        },
      ),
    );
  }
}



