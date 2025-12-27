import 'package:ecommerce_app/features/cart/domin/entities/cart_item_entity.dart';

import 'Product.dart';

class CartItem {
  const CartItem({
      required this.count,
      required this.id,
      required this.product,
      required this.price,});

  factory CartItem.fromJson(dynamic json) {
    return CartItem(
        count:  json['count'],
        id: json['_id'],
        product:  Product.fromJson(json['product']),
        price: json['price']);

  }
  final int count;
  final String id;
  final Product product;
  final int price;

  CartItemEntity toCartItemEntity()=>CartItemEntity(count: count, id: id, product: product.toProductEntity(), price: price);


}