// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../data/repos/data_sources/products_data_source_impl.dart' as _i8;
import '../../data/repos/products_repo_impl.dart' as _i10;
import '../../presentation/view_models/products_view_model.dart' as _i12;
import '../../utils/networking/api_factory.dart' as _i5;
import '../../utils/networking/dio_factory.dart' as _i6;
import '../repos/data_sources/products_data_source.dart' as _i7;
import '../repos/products_repo.dart' as _i9;
import '../use_cases/get_all_products_use_case.dart' as _i11;
import 'packages_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final packagesModule = _$PackagesModule();
    gh.factory<_i3.Dio>(() => packagesModule.getDio());
    gh.factory<_i4.InternetConnectionChecker>(
        () => packagesModule.getInternetConnectionChecker());
    gh.factory<_i5.ApiFactory>(() => _i6.DioFactory(dio: gh<_i3.Dio>()));
    gh.factory<_i7.ProductsDataSource>(
        () => _i8.ProductsDataSourceImpl(gh<_i5.ApiFactory>()));
    gh.factory<_i9.ProductsRepo>(() => _i10.ProductsRepoImpl(
          gh<_i4.InternetConnectionChecker>(),
          gh<_i7.ProductsDataSource>(),
        ));
    gh.factory<_i11.GetAllProductsUseCase>(
        () => _i11.GetAllProductsUseCase(gh<_i9.ProductsRepo>()));
    gh.factory<_i12.ProductsViewModel>(
        () => _i12.ProductsViewModel(gh<_i11.GetAllProductsUseCase>()));
    return this;
  }
}

class _$PackagesModule extends _i13.PackagesModule {}
