import 'package:ecommerce_app/features/main_layout/home/domin/entities/category_entity.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,});

  factory Category.fromJson(dynamic json) {
    return Category(id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt:  json['updatedAt']);
  }

  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;


  CategoryEntity toCategoryEntity(){
    return CategoryEntity(id: id, name: name, image: image);
  }
}