import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domin/entities/cart_entity.dart';

abstract class CartRepository{
  Future<Either<Failure,void>> addToCart({required String productId});
  Future<Either<Failure,CartEntity>> getCart();
  Future<Either<Failure,CartEntity>> updateCartProductQuantity({required String productId,required String quantity});
  Future<Either<Failure,CartEntity>> deleteProductFromCart({required String productId});
  Future<Either<Failure,void>> clearCart();
}