import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_ropository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authApiRemoteDataSource});
  final AuthRemoteDataSource authApiRemoteDataSource;
  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return authApiRemoteDataSource.register(request);
  }
}