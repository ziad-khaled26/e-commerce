import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';

abstract class AuthRepository{
  Future<RegisterResponse> register(RegisterRequest request);

}