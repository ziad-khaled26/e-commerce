import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/constants_manager.dart';
@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource{
  @override
  Future<void> saveToken(String token) async {
    try{
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(CacheConstants.tokenKey, token);
    } catch (exception){
      throw LocalException(message: "Failed to save Token");
    }
  }

  @override
  Future<String> getToken() async{
    try {
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      return sharedPrefs.getString(CacheConstants.tokenKey)!;
    }catch (exception){
      throw LocalException(message: "Failed to get Token");
    }
  }

}