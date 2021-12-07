import 'package:softscope/modules/shop_app/login/shop_login_screen.dart';
import 'package:softscope/shared/components/conponents.dart';
import 'package:softscope/shared/network/local/cachehelper/cache_helper.dart';

 String token = '';

 String uId = '';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',

  ).then((value) {
    if (value) {
      print('uId');
      navigateAndFinish(
        context,
        ShopLoginScreen(),
      );
    }
  });
}
/// iWF26Ut0pzdPg5HCSJRjvCDAJU53
///
///  'ztYEZDL5G8g6jmxLkOihk7EYEJh2'