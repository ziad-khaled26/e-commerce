import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/domin/entities/user_entitiy.dart';
import 'package:injectable/injectable.dart';

import '../../domin/repositories/auth_ropository.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authApiRemoteDataSource,required this.authSharedPrefsLocalDataSource});
  final AuthRemoteDataSource authApiRemoteDataSource;
  final AuthLocalDataSource authSharedPrefsLocalDataSource;
  @override
  Future<Either<Failure,UserEntity>> register(RegisterRequest request) async{
    try {
      final registerResponse = await authApiRemoteDataSource.register(request);
      await authSharedPrefsLocalDataSource.saveToken(registerResponse.token);

      return right(registerResponse.user.toUserEntity());
    }on AppException catch(exception){
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest request) async{
    try{
      final response = await authApiRemoteDataSource.login(request);
      await authSharedPrefsLocalDataSource.saveToken(response.token);
      return right(response.user.toUserEntity());
    }on AppException catch(exception){
      return left(Failure(message: exception.message));
    }
  }
}