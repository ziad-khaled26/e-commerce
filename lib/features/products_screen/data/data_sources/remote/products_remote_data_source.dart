import 'package:ecommerce_app/features/products_screen/data/modles/Products_response.dart';

abstract class ProductsRemoteDataSource{
  Future<ProductsResponse>getProducts([String? categoryId]);
}