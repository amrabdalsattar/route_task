import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/data/models/product_response/product_response.dart';
import 'package:route_task/domain/repos/data_sources/products_data_source.dart';
import 'package:route_task/domain/repos/products_repo.dart';
import 'package:route_task/utils/networking/api_constants.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  final ProductsDataSource dataSource;
  final InternetConnectionChecker connectionChecker;

  ProductsRepoImpl(this.connectionChecker, this.dataSource);

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    bool isConnectedToInternet = await connectionChecker.hasConnection;
    if (isConnectedToInternet) {
      return dataSource.productsOnlineDataSource();
    } else {
      return const Left(NetworkFailure(ApiConstants.networkErrorMessage));
    }
  }
}
