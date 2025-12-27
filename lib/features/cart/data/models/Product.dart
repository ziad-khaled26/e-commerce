import 'package:ecommerce_app/features/cart/domin/entities/product_entity.dart';

import '../../../products_screen/data/modles/Brand.dart';
import '../../../products_screen/data/modles/Category.dart';


class Product {
  const Product({
      required this.id,
      required this.title,
      required this.quantity,
      required this.imageCover,
      required this.category,
      required this.brand,
      required this.ratingsAverage,
      });

  factory Product.fromJson(dynamic json) {
    return Product(
        id: json['_id'],
        title: json['title'],
        quantity: json['quantity'],
        imageCover: json['imageCover'],
        category:  Category.fromJson(json['category']),
        brand: Brand.fromJson(json['brand']),
        ratingsAverage: json['ratingsAverage']);
  }
  final String id;
  final String title;
  final int? quantity;
  final String imageCover;
  final Category category;
  final Brand brand;
  final num ratingsAverage;


  ProductEntity toProductEntity()=>ProductEntity(id: id, title: title, imageCover: imageCover);



}