import 'package:ecommerce_app/features/cart/domin/entities/cart_item_entity.dart';

class CartEntity{
  final List<CartItemEntity> cartItems;
  final int totalCartPrice;

  CartEntity({required this.cartItems,required this.totalCartPrice});

}