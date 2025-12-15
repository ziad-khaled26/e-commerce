import '../categories_response/Metadata.dart';
import 'brand.dart';

class BrandsResponse {
  const BrandsResponse({
    required this.results,
    required this.metadata,
    required this.brands,
  });

  factory BrandsResponse.fromJson(dynamic json) {
    return BrandsResponse(
        results: json['results'],
        metadata: Metadata.fromJson(json['metadata']),
        brands: (json['data'] as List<dynamic>)
            .map((json) => Brand.fromJson(json))
            .toList());
  }

  final int results;
  final Metadata metadata;
  final List<Brand> brands;
}
