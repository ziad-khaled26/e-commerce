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
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_api_remote_data_source.dart'
    as _i77;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart'
    as _i35;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/categories_repository_impl.dart'
    as _i105;
import 'package:ecommerce_app/features/main_layout/home/domin/repository_contract/categories_repository.dart'
    as _i334;
import 'package:ecommerce_app/features/main_layout/home/domin/use_cases/categories_use_case.dart'
    as _i893;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categories_cubit.dart'
    as _i851;
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
    gh.lazySingleton<_i35.CategoriesRemoteDataSource>(
        () => _i77.CategoriesApiRemoteDataSource());
    gh.lazySingleton<_i334.CategoriesRepository>(() =>
        _i105.CategoriesRepositoryImpl(
            categoriesRemoteDataSource: gh<_i35.CategoriesRemoteDataSource>()));
    gh.singleton<_i912.LoginUseCase>(
        () => _i912.LoginUseCase(authRepository: gh<_i415.AuthRepository>()));
    gh.singleton<_i53.RegisterUseCase>(
        () => _i53.RegisterUseCase(authRepository: gh<_i415.AuthRepository>()));
    gh.lazySingleton<_i893.CategoriesUseCase>(() => _i893.CategoriesUseCase(
        categoriesRepository: gh<_i334.CategoriesRepository>()));
    gh.lazySingleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        categoriesUseCase: gh<_i893.CategoriesUseCase>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i53.RegisterUseCase>(),
          loginUseCase: gh<_i912.LoginUseCase>(),
        ));
    return this;
  }
}
