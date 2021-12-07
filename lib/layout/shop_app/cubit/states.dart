import 'package:softscope/models/shop_app/change_favorites_model.dart';
import 'package:softscope/models/shop_app/login_model.dart';

abstract class ShopStates{}

 class ShopInitialState extends ShopStates {}

 class ShopChangeBottomNavState extends ShopStates {}

 class ShopLoadingHomeDataState extends ShopStates {}

 class ShopSuccessHomeDataState extends ShopStates {}

 class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesDataState extends ShopStates {}

class ShopErrorCategoriesDataState extends ShopStates {}

class ShopChangeFavoriteState extends ShopStates {}

class ShopSuccessChangeFavoriteDataState extends ShopStates {

 final ChangeFavoritesModel model;

  ShopSuccessChangeFavoriteDataState(this.model);
}

class ShopErrorChangeFavoriteDataState extends ShopStates {}

class ShopLoadingFavoritesDataState extends ShopStates {}

class ShopSuccessFavoritesDataState extends ShopStates {}

class ShopErrorFavoritesDataState extends ShopStates {}

/// cubit  ShopLoginModel userModel
class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
 final ShopLoginModel loginModel ;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}
