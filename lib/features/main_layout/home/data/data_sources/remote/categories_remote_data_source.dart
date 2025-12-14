import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/Categories_response.dart';

abstract class CategoriesRemoteDataSource{
  Future<CategoriesResponse> getCategories();
}