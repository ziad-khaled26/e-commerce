import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';

abstract class AuthRepository{
  Future<Either<Failure,User>> register(RegisterRequest request);
  Future<Either<Failure,User>> login(LoginRequest request);

}