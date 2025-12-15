import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domin/entities/productEntity.dart';
import 'package:ecommerce_app/features/products_screen/domin/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts([String? categoryId]) async {
    try{
      final response = await remoteDataSource.getProducts(categoryId);
      return Right(response.products
          .map((product) => product.toProductEntity())
          .toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}
