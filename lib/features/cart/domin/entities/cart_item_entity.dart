import 'package:ecommerce_app/features/cart/domin/entities/product_entity.dart';

class CartItemEntity{
  final int count;
  final String id;
  final ProductEntity product;
  final int price;

  CartItemEntity({required this.count,required this.id,required this.product,required this.price});
}