import 'package:ecommerce_app/features/main_layout/home/domin/entities/brand_entity.dart';

class Brand {
  const Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,});

  factory Brand.fromJson(dynamic json) {
    return Brand(id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  final String id;
  final String name;
  final String image;
  final String slug;
  final String createdAt;
  final String updatedAt;

  BrandEntity toBrandEntity(){
    return BrandEntity(id: id, name: name, image: image);
  }
}