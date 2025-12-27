import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../cart_repository_contract/cart_repository.dart';

class ClearCartUseCase{
  final CartRepository cartRepository;
  ClearCartUseCase({required this.cartRepository});
  Future<Either<Failure, void>>call(){
    return cartRepository.clearCart();
  }
}