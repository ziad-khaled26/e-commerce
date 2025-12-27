// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i1050;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i485;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i609;
import 'package:ecommerce_app/features/auth/domin/repositories/auth_ropository.dart'
    as _i415;
import 'package:ecommerce_app/features/auth/domin/use_cases/login_use_case.dart'
    as _i912;
import 'package:ecommerce_app/features/auth/domin/use_cases/register_use_case.dart'
    as _i53;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_api_remote_data_source.dart'
    as _i934;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i1015;
import 'package:ecommerce_app/features/cart/data/repositoreis_impl/cart_repository_impl.dart'
    as _i476;
import 'package:ecommerce_app/features/cart/domin/cart_repository_contract/cart_repository.dart'
    as _i888;
import 'package:ecommerce_app/features/cart/domin/use_cases/add_to_cart_use_case.dart'
    as _i537;
import 'package:ecommerce_app/features/cart/domin/use_cases/delete_product_from_cart_use_case.dart'
    as _i397;
import 'package:ecommerce_app/features/cart/domin/use_cases/get_cart_use_case.dart'
    as _i450;
import 'package:ecommerce_app/features/cart/domin/use_cases/update_cart_product_quantity_use_case.dart'
    as _i507;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart'
    as _i390;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_api_remote_data_source.dart'
    as _i720;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart'
    as _i1071;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_api_remote_data_source.dart'
    as _i77;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart'
    as _i35;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/brands_repository_impl.dart'
    as _i101;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/categories_repository_impl.dart'
    as _i105;
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/brands_repository.dart'
    as _i750;
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/categories_repository.dart'
    as _i334;
import 'package:ecommerce_app/features/main_layout/home/domin/use_cases/brands_use_case.dart'
    as _i541;
import 'package:ecommerce_app/features/main_layout/home/domin/use_cases/categories_use_case.dart'
    as _i893;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brands_cubit.dart'
    as _i906;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categories_cubit.dart'
    as _i851;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_api_remote_data_source.dart'
    as _i302;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart'
    as _i1062;
import 'package:ecommerce_app/features/products_screen/data/repositories_impl/products_repository_impl.dart'
    as _i143;
import 'package:ecommerce_app/features/products_screen/domin/repositories/products_repository.dart'
    as _i815;
import 'package:ecommerce_app/features/products_screen/domin/use_cases/products_use_case.dart'
    as _i537;
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart'
    as _i829;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1050.AuthLocalDataSource>(
        () => _i485.AuthSharedPrefsLocalDataSource());
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource());
    gh.singleton<_i415.AuthRepository>(() => _i609.AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          authSharedPrefsLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i1071.BrandsRemoteDataSource>(
        () => _i720.BrandsApiRemoteDataSource());
    gh.lazySingleton<_i35.CategoriesRemoteDataSource>(
        () => _i77.CategoriesApiRemoteDataSource());
    gh.lazySingleton<_i1015.CartRemoteDataSource>(
        () => _i934.CartApiRemoteDataSource());
    gh.lazySingleton<_i1062.ProductsRemoteDataSource>(
        () => _i302.ProductsApiRemoteDataSource());
    gh.lazySingleton<_i815.ProductsRepository>(() =>
        _i143.ProductsRepositoryImpl(
            remoteDataSource: gh<_i1062.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i334.CategoriesRepository>(() =>
        _i105.CategoriesRepositoryImpl(
            categoriesRemoteDataSource: gh<_i35.CategoriesRemoteDataSource>()));
    gh.singleton<_i912.LoginUseCase>(
        () => _i912.LoginUseCase(authRepository: gh<_i415.AuthRepository>()));
    gh.singleton<_i53.RegisterUseCase>(
        () => _i53.RegisterUseCase(authRepository: gh<_i415.AuthRepository>()));
    gh.lazySingleton<_i888.CartRepository>(() => _i476.CartRepositoryImpl(
          cartRemoteDataSource: gh<_i1015.CartRemoteDataSource>(),
          authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i537.ProductsUseCase>(() => _i537.ProductsUseCase(
        productsRepository: gh<_i815.ProductsRepository>()));
    gh.lazySingleton<_i537.AddToCartUseCase>(() =>
        _i537.AddToCartUseCase(cartRepository: gh<_i888.CartRepository>()));
    gh.lazySingleton<_i397.DeleteProductFromCartUseCase>(() =>
        _i397.DeleteProductFromCartUseCase(
            cartRepository: gh<_i888.CartRepository>()));
    gh.lazySingleton<_i450.GetCartUseCase>(
        () => _i450.GetCartUseCase(cartRepository: gh<_i888.CartRepository>()));
    gh.lazySingleton<_i507.UpdateCartProductQuantityUseCase>(() =>
        _i507.UpdateCartProductQuantityUseCase(
            cartRepository: gh<_i888.CartRepository>()));
    gh.lazySingleton<_i750.BrandsRepository>(() => _i101.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i1071.BrandsRemoteDataSource>()));
    gh.lazySingleton<_i541.BrandsUseCase>(() =>
        _i541.BrandsUseCase(brandsRepository: gh<_i750.BrandsRepository>()));
    gh.lazySingleton<_i893.CategoriesUseCase>(() => _i893.CategoriesUseCase(
        categoriesRepository: gh<_i334.CategoriesRepository>()));
    gh.lazySingleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        categoriesUseCase: gh<_i893.CategoriesUseCase>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i53.RegisterUseCase>(),
          loginUseCase: gh<_i912.LoginUseCase>(),
        ));
    gh.lazySingleton<_i906.BrandsCubit>(
        () => _i906.BrandsCubit(brandsUseCase: gh<_i541.BrandsUseCase>()));
    gh.factory<_i829.ProductsCubit>(() =>
        _i829.ProductsCubit(productsUseCase: gh<_i537.ProductsUseCase>()));
    gh.lazySingleton<_i390.CartCubit>(() => _i390.CartCubit(
          addToCartUseCase: gh<_i537.AddToCartUseCase>(),
          getCartUseCase: gh<_i450.GetCartUseCase>(),
          updateCartProductQuantityUseCase:
              gh<_i507.UpdateCartProductQuantityUseCase>(),
          deleteProductFromCartUseCase:
              gh<_i397.DeleteProductFromCartUseCase>(),
        ));
    return this;
  }
}
