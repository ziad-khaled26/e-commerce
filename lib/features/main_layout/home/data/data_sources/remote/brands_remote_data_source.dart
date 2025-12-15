import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brands_response.dart';

abstract class BrandsRemoteDataSource{
  Future<BrandsResponse> getBrands();
}