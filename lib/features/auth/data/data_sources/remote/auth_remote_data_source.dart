import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';

abstract class AuthRemoteDataSource{
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}