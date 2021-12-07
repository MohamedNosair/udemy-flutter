import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/shop_app/cubit/states.dart';
import 'package:softscope/models/shop_app/cagetgories_model.dart';
import 'package:softscope/models/shop_app/change_favorites_model.dart';
import 'package:softscope/models/shop_app/favorites_model.dart';
import 'package:softscope/models/shop_app/home_model.dart';
import 'package:softscope/models/shop_app/login_model.dart';
import 'package:softscope/modules/shop_app/categories/categories_screen.dart';
import 'package:softscope/modules/shop_app/favorites/favorits_screen.dart';
import 'package:softscope/modules/shop_app/products/products_screen.dart';
import 'package:softscope/modules/shop_app/settings/setting_screen.dart';
import 'package:softscope/shared/components/constants.dart';
import 'package:softscope/shared/network/end_points.dart';
import 'package:softscope/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;

    emit(ShopChangeBottomNavState());
  }

  late HomeModel homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel.data.banners[0].id);
      homeModel.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      print(' this is my favorite list ${favorites.toString()}');
      print('this is my token $token');

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  late CategoriesModel categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      print(homeModel.data!.banners[0].id);

      print('this is my token $token');

      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      //print(error.toString());
      emit(ShopErrorCategoriesDataState());
    });
  }

  late ChangeFavoritesModel changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    // print(favorites.toString());
    emit(ShopChangeFavoriteState());

    DioHelper.postData(
      url: FAVORITES,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      //print(value.data.toString());
      print('this is my token $token');

      if (!changeFavoritesModel.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
      }

      emit(ShopSuccessChangeFavoriteDataState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(ShopErrorChangeFavoriteDataState());
    });
  }

  late FavoritesModel favoritesModel;

  void getFavoritesData() {
    emit(ShopLoadingFavoritesDataState());

    DioHelper.getData(
      url: GET_FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      print('this is my token $token');

      emit(ShopSuccessFavoritesDataState());
    }).catchError((error) {
      //print(error.toString());
      emit(ShopErrorFavoritesDataState());
    });
  }

  late ShopLoginModel userModel;

  void getProfileData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      print(userModel.data!.name);

      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      //print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void UpdateData({
    required String name,
    required String email,
    required String phone,
    required String image,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      print(userModel.data!.name);

      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      //print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
