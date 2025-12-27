import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/domin/cart_repository_contract/cart_repository.dart';
import 'package:ecommerce_app/features/cart/domin/entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource,required this.authLocalDataSource});
  @override
  Future<Either<Failure, void>> addToCart({required String productId}) async{
    try{
      await cartRemoteDataSource.addToCart(
          productId: productId, token: await authLocalDataSource.getToken());
      return Right(null);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async{
    try{
      final cartResponse = await cartRemoteDataSource.getCart(
          token: await authLocalDataSource.getToken());
      return Right(cartResponse.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateCartProductQuantity({required String productId, required String quantity}) async{
    try{
      final cartResponse = await cartRemoteDataSource.updateCartProductQuantity(
          productId: productId,
          quantity: quantity,
          token: await authLocalDataSource.getToken());
      return Right(cartResponse.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> deleteProductFromCart({required String productId}) async{
    try{
      final cartResponse = await cartRemoteDataSource.deleteProductFromCart(
          productId: productId, token: await authLocalDataSource.getToken());
      return Right(cartResponse.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async{
    try{
      await cartRemoteDataSource.clearCart(
          token: await authLocalDataSource.getToken());
      return Right(null);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }


 

 
  
}