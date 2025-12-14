import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/Categories_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource{
  Dio dio=Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<CategoriesResponse> getCategories() async{
    try{
      final response = await dio.get(ApiConstants.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message=exception.response?.data["message"];
      }
      throw RemoteException(remoteExceptionMessage: message??"Failed to get Categories");
    }
  }
}