import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domin/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/productEntity.dart';
@lazySingleton
class ProductsUseCase{
  ProductsRepository productsRepository;
  ProductsUseCase({required this.productsRepository});
  Future<Either<Failure, List<ProductEntity>>> call([String? categoryId]){
    return productsRepository.getProducts(categoryId);
  }
}