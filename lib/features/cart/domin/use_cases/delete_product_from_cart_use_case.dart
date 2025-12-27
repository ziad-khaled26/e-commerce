import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../cart_repository_contract/cart_repository.dart';
import '../entities/cart_entity.dart';
@lazySingleton
class DeleteProductFromCartUseCase{
  final CartRepository cartRepository;
  DeleteProductFromCartUseCase({required this.cartRepository});
  Future<Either<Failure, CartEntity>>call({required String productId}){
    return cartRepository.deleteProductFromCart(productId: productId);
  }
}