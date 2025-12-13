import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_ropository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}):super(InitialState());
  Future<void> register(RegisterRequest request)async{
   try{
     emit(RegisterLoading());
     final response=await authRepository.register(request);
     emit(RegisterSuccess());
   }
   on DioException catch (exception){
     if(exception.response?.statusCode==409){
       emit(RegisterError(errorMessage: "Conflict error"));
     }
     else{
       emit(RegisterError(errorMessage: exception.toString()));
     }


   }
  }
}

class AuthState{}
class InitialState extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterError extends AuthState{
  RegisterError({required this.errorMessage});
  final String errorMessage;
}
class RegisterSuccess extends AuthState{
  RegisterSuccess();
}