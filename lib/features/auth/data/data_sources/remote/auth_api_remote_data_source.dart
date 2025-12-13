import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await dio.post(ApiConstants.registerEndPoint,
          data: registerRequest.toJson());
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String message;
      if (exception is DioException) {
        if (exception.type == DioExceptionType.badResponse) {
          message = exception.response!.data["message"];
        } else {
          message = "Failed To Register";
        }
        throw RemoteException(remoteExceptionMessage: message);
      }
      message = "some thing went wrong!";
      throw RemoteException(remoteExceptionMessage: message);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async{
    try{
      final response =
          await dio.post(ApiConstants.loginEndPoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        if(exception.type==DioExceptionType.badResponse){
          message=exception.response!.data["message"];
        }
      }
      throw RemoteException(remoteExceptionMessage: message??"Failed to login");
    }
  }
}
