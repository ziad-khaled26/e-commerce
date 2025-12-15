class Brand {
  const Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    });

  factory Brand.fromJson(dynamic json) {
    return Brand(id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        image: json['image'],
        );
  }

  final String id;
  final String name;
  final String image;
  final String slug;



}