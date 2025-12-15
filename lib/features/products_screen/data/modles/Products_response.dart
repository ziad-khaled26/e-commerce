import '../../../main_layout/home/data/models/categories_response/Metadata.dart';
import 'product.dart';

class ProductsResponse {
  const ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductsResponse.fromJson(dynamic json) {
    return ProductsResponse(
        results: json['results'],
        metadata: Metadata.fromJson(json['metadata']),
        products: (json['data'] as List<dynamic>)
            .map((json) => Product.fromJson(json))
            .toList());
  }

  final num results;
  final Metadata metadata;
  final List<Product> products;
}
