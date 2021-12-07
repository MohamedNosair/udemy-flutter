import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/news_app/cubit/cubit.dart';
import 'package:softscope/layout/shop_app/cubit/cubit.dart';
import 'package:softscope/layout/social_app/cubit/cubit.dart';
import 'package:softscope/layout/social_app/social_layout.dart';
import 'package:softscope/modules/shop_app/login/shop_login_screen.dart';
import 'package:softscope/modules/social_app/login/social_login_screen.dart';
import 'package:softscope/shared/bloc_observer.dart';
import 'package:softscope/shared/components/conponents.dart';
import 'package:softscope/shared/components/constants.dart';
import 'package:softscope/shared/cubit/cubit.dart';
import 'package:softscope/shared/cubit/states.dart';
import 'package:softscope/shared/network/local/cachehelper/cache_helper.dart';
import 'package:softscope/shared/network/remote/dio_helper.dart';
import 'package:softscope/shared/styles/themes.dart';
import 'layout/shop_app/shop_layout.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async
{

}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token = FirebaseMessaging.instance.getToken();
  print('${token} my name token');

  FirebaseMessaging.onMessage.listen((event){
    print(event.data.toString());
    print(event.notification.toString());
    showToast(text: 'On Message', state: ToastState.SUCCESS);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event){
    print(event.data.toString());
    print(event.notification.toString());
    showToast(text: 'on message opened app', state: ToastState.SUCCESS);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  print('${token} my name token');
  Bloc.observer =  MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key:'isDark');

  Widget widget ;

  // bool onBoarding = CacheHelper.getData(key: 'onBoarding');
   //token = CacheHelper.getData(key:'token');

  uId = CacheHelper.getData(key:'uId');
  print('${uId} my name UID');

  // if(onBoarding != null )
  // {
  //   if(token != null ) widget = ShopLayout();
  //   else widget = ShopLoginScreen();
  // }else
  //   {
  //     widget = OnBoardingScreen() ;
  //   }

  if( uId != null)
  {
    widget = SocialLayout();
  }else
    {
      widget = SocialLoginScreen();
    }
  // print(onBoarding);
  // print(isDark);
  // print(' yes token $token');
  runApp(myApp(
    isDark : isDark,
    startWidget : widget ,
  ));
 // myApp app = myApp() ;
}

// ignore: camel_case_types
class myApp extends StatelessWidget {

   bool? isDark;
   Widget? startWidget ;

  myApp({
     this.isDark,
     this.startWidget
  });

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                AppCubit()..changeAppMode( fromShared: isDark! )),
        BlocProvider(
          create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getProfileData(),
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getUserData()..getPosts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: false ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}

///NewsLayout()
///C:\Users\DELL\AppData\Local\Android\Sdk\platform-tools