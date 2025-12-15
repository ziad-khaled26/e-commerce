import 'package:ecommerce_app/features/products_screen/domin/entities/productEntity.dart';

import 'Category.dart';
import 'Brand.dart';

class Product {
  const Product({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.priceAfterDiscount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(dynamic json) {
    return Product(sold: json['sold'],
        images: json['images'].cast<String>(),
        ratingsQuantity: json['ratingsQuantity'],
        id: json['_id'],
        title: json['title'],
        slug: json['slug'],
        description:  json['description'],
        quantity: json['quantity'],
        price: json['price'],
        imageCover: json['imageCover'],
        category:  Category.fromJson(json['category']),
        brand: Brand.fromJson(json['brand']),
        ratingsAverage: json['ratingsAverage'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        priceAfterDiscount: json["priceAfterDiscount"]);
  }

  final num? sold;
  final List<String> images;
  final num ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final Category category;
  final Brand brand;
  final num ratingsAverage;
  final num? priceAfterDiscount;
  final String createdAt;
  final String updatedAt;

  ProductEntity toProductEntity(){
    return ProductEntity(sold: sold, images: images, ratingsQuantity: ratingsQuantity, id: id, title: title, slug: slug, description: description, quantity: quantity, price: price, imageCover: imageCover, category: category, brand: brand, ratingsAverage: ratingsAverage, priceAfterDiscount: priceAfterDiscount);
  }
}