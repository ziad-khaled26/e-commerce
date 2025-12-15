import 'package:ecommerce_app/features/products_screen/domin/entities/productEntity.dart';
import 'package:ecommerce_app/features/products_screen/domin/use_cases/products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState>{
  ProductsUseCase productsUseCase;
  ProductsCubit({required this.productsUseCase}):super(ProductsInitialState());
  Future<void> getProducts([String? categoryId])async{
    emit(ProductsLoading());
    final result=await productsUseCase(categoryId);
    result.fold(
            (failure){
              emit(ProductsError(message: failure.message));
            },
            (products){
              emit(ProductsSuccess(products: products));
            }
    );
  }
}


abstract class ProductsState{}
class ProductsInitialState extends ProductsState{}
class ProductsLoading extends ProductsState{}
class ProductsError extends ProductsState{
  String message;
  ProductsError({required this.message});
}
class ProductsSuccess extends ProductsState{
  List<ProductEntity> products;
  ProductsSuccess({required this.products});
}