import 'package:ecommerce_app/features/cart/domin/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domin/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domin/use_cases/delete_product_from_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domin/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domin/use_cases/update_cart_product_quantity_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final UpdateCartProductQuantityUseCase updateCartProductQuantityUseCase;
  final DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  late CartEntity cart;
  CartCubit(
      {required this.addToCartUseCase,
      required this.getCartUseCase,
      required this.updateCartProductQuantityUseCase,
      required this.deleteProductFromCartUseCase}) : super(CartInitial());

  Future<void>addToCart({required String productId})async{
    emit(AddToCartLoading());
    final result=await addToCartUseCase(productId: productId);
    result.fold(
            (failure){
              emit(AddToCartError(message: failure.message));
            },
            (_){
              emit(AddToCartSuccess());
            });
  }
  Future<void>getCart()async{
    emit(GetCartLoading());
    final result=await getCartUseCase();
    result.fold(
            (failure){
              emit(GetCartError(message: failure.message));
            },
            (cartEntity){
              cart=cartEntity;
              emit(GetCartSuccess());
            });
  }
  Future<void>updateCartProductQuantity({required String productId,required String quantity})async{
    emit(UpdateCartProductQuantityLoading());
    final result=await updateCartProductQuantityUseCase(productId:productId,quantity: quantity );
    result.fold(
            (failure){
              emit(UpdateCartProductQuantityError(message: failure.message));
            }, (cartEntity){
              cart=cartEntity;
              emit(UpdateCartProductQuantitySuccess());
    });
  }
  Future<void>deleteProductFromCart({required String productId})async{
    emit(DeleteProductFromCartLoading());
    final result=await deleteProductFromCartUseCase(productId: productId);
    result.fold(
            (failure){
              emit(DeleteProductFromCartError(message: failure.message));
            },
            (cartEntity){
              cart=cartEntity;
              emit(DeleteProductFromCartSuccess());
            });
  }
}

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}
class AddToCartError extends CartState {
  String message;

  AddToCartError({required this.message});
}
class AddToCartSuccess extends CartState {}

class GetCartLoading extends CartState {}
class GetCartError extends CartState {
  String message;

  GetCartError({required this.message});
}
class GetCartSuccess extends CartState {}

class UpdateCartProductQuantityLoading extends CartState {}
class UpdateCartProductQuantityError extends CartState {
  String message;

  UpdateCartProductQuantityError({required this.message});
}
class UpdateCartProductQuantitySuccess extends CartState {}

class DeleteProductFromCartLoading extends CartState {}
class DeleteProductFromCartError extends CartState {
  String message;

  DeleteProductFromCartError({required this.message});
}
class DeleteProductFromCartSuccess extends CartState {}
