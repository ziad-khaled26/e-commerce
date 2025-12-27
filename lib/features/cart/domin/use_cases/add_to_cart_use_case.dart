import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/domin/cart_repository_contract/cart_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';

@lazySingleton
class AddToCartUseCase{
  final CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});
  Future<Either<Failure, void>>call({required String productId}){
    return cartRepository.addToCart(productId: productId);
  }
}