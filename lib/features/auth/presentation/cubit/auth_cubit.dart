import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_ropository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState>{
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}):super(InitialState());
  Future<void> register(RegisterRequest request)async{
    emit(RegisterLoading());
    final result=await authRepository.register(request);
    result.fold(
        (failure){
          emit(RegisterError(errorMessage: failure.message));
        },
        (user){
          emit(RegisterSuccess());
        }
    );
  }

  Future<void>login(LoginRequest request)async{
    emit(LoginLoading());
    final result=await authRepository.login(request);
    result.fold(
        (failure){
          emit(LoginError(message: failure.message));
        },
        (user){
          emit(LoginSuccess());
        }
    );
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

class LoginLoading extends AuthState{}
class LoginError extends AuthState{
  final String message;
  LoginError({required this.message});
}
class LoginSuccess extends AuthState{}