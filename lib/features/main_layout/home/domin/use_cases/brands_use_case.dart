import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/brand_entity.dart';

@lazySingleton
class BrandsUseCase{
  BrandsRepository brandsRepository;
  BrandsUseCase({required this.brandsRepository});
  Future<Either<Failure, List<BrandEntity>>> call(){
    return brandsRepository.getBrands();
  }
}