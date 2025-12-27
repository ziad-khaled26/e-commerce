import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../cart_repository_contract/cart_repository.dart';
import '../entities/cart_entity.dart';
@lazySingleton
class GetCartUseCase{
  final CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<Either<Failure, CartEntity>>call(){
    return cartRepository.getCart();
  }
}