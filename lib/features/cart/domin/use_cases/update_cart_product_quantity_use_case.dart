import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../cart_repository_contract/cart_repository.dart';
import '../entities/cart_entity.dart';
@lazySingleton
class UpdateCartProductQuantityUseCase{
  final CartRepository cartRepository;
  UpdateCartProductQuantityUseCase({required this.cartRepository});
  Future<Either<Failure, CartEntity>>call({required String productId,required String quantity}){
    return cartRepository.updateCartProductQuantity(productId: productId, quantity: quantity);
  }
}