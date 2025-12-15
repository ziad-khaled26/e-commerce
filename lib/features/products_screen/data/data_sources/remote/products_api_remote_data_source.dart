import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/modles/Products_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductsRemoteDataSource)
class ProductsApiRemoteDataSource implements ProductsRemoteDataSource{
  Dio dio=Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<ProductsResponse> getProducts([String? categoryId]) async{
    try{
      final response = await dio.get(ApiConstants.productsEndPoint,
          queryParameters: {"category": categoryId});
      return ProductsResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message=exception.response?.data["message"];
      }
      throw RemoteException(remoteExceptionMessage: message??exception.toString());
    }
  }
  
}