import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domin/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository {
  BrandsRemoteDataSource brandsRemoteDataSource;

  BrandsRepositoryImpl({required this.brandsRemoteDataSource});

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try{
      final response = await brandsRemoteDataSource.getBrands();
      return Right(response.brands
          .map((brandModel) => brandModel.toBrandEntity())
          .toList());
    }on RemoteException catch(remoteException){
      return Left(Failure(message: remoteException.message));
    }
  }
}
