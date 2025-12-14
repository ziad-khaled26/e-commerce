import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/domin/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domin/use_cases/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState>{
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  AuthCubit({required this.registerUseCase,required this.loginUseCase}):super(InitialState());
  Future<void> register(RegisterRequest request)async{
    emit(RegisterLoading());
    final result=await registerUseCase(request);
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
    final result=await loginUseCase(request);
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