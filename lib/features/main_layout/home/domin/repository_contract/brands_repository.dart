import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';

import '../entities/brand_entity.dart';

abstract class BrandsRepository{
  Future<Either<Failure,List<BrandEntity>>> getBrands();
}