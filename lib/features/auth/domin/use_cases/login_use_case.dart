import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/domin/repositories/auth_ropository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entitiy.dart';
@singleton
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>>call(LoginRequest request){
    return authRepository.login(request);
  }
}