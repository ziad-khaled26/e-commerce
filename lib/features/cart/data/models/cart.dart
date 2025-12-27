import 'package:ecommerce_app/features/cart/domin/entities/cart_entity.dart';

import 'cart_item.dart';

class Cart {
  const Cart({
    required this.id,
    required this.cartOwner,
    required this.cartItems,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  factory Cart.fromJson(dynamic json) {
    return Cart(
        id: json['_id'],
        cartOwner: json['cartOwner'],
        cartItems: (json['products'] as List<dynamic>)
            .map((json) => CartItem.fromJson(json))
            .toList(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v'],
        totalCartPrice: json['totalCartPrice']);
  }

  final String? id;
  final String? cartOwner;
  final List<CartItem> cartItems;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int totalCartPrice;

  CartEntity toCartEntity()=>CartEntity(cartItems: cartItems.map((cartItem)=>cartItem.toCartItemEntity()).toList(), totalCartPrice: totalCartPrice);
}
