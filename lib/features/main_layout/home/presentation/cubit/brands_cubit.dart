import 'package:ecommerce_app/features/main_layout/home/domin/use_cases/brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domin/entities/brand_entity.dart';

@lazySingleton
class BrandsCubit extends Cubit<BrandsState>{
  BrandsUseCase brandsUseCase;
  BrandsCubit({required this.brandsUseCase}):super(BrandsInitialState());
  Future<void>getBrands()async{
    emit(BrandsLoading());
    final result=await brandsUseCase();
    result.fold(
            (failure){
          emit(BrandsError(message: failure.message));
        },
            (brands){
          emit(BrandsSuccess(brands: brands));
        }
    );
  }

}

abstract class BrandsState{}
class BrandsInitialState extends BrandsState{}
class BrandsLoading extends BrandsState{}
class BrandsError extends BrandsState{
  String message;
  BrandsError({required this.message});
}
class BrandsSuccess extends BrandsState{
  List<BrandEntity> brands;
  BrandsSuccess({required this.brands});
}