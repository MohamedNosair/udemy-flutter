import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/models/social_app/social_user_model.dart';
import 'package:softscope/modules/social_app/register/cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    print(
      'hello'
    );
    emit(SocialRegisterLoadingState());
    FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){

      createUser(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name:name ,
      );
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })
  {
   SocialUserModel model = SocialUserModel(
     name: name,
     email: email,
     phone: phone,
     image:'https://image.freepik.com/free-photo/indoor-shot-dreamy-positive-young-woman-uses-mobile-phone-checks-messages-dressed-pink-knitted-jumper-isolated-blue-wall-with-copy-space-your-promotional-reads-article_273609-26314.jpg',
     cover:'https://image.freepik.com/free-vector/paper-style-new-year-landing-page-template_23-2149149031.jpg',
     bio: 'Write your bio here...',
     uId: uId,
     isEmailVerified: false,
   );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(SocialCreateUserSuccessState());
    }).catchError((error){
      SocialCreateUserErrorState(error.toString());
    });
  }

  IconData suffix = Icons.visibility_off_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SocialChangeRegisterPasswordVisibilityState());
  }
}


/// bIY16KQzjMV4m0TUknywL2bqp0Q2