import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/category_entity.dart';
@lazySingleton
class CategoriesUseCase{
  CategoriesRepository categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});
  Future<Either<Failure, List<CategoryEntity>>> call(){
    return categoriesRepository.getCategories();
  }
}