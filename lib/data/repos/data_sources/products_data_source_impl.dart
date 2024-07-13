import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/data/models/product_response/product_response.dart';
import 'package:route_task/domain/repos/data_sources/products_data_source.dart';
import 'package:route_task/utils/networking/api_constants.dart';
import 'package:route_task/utils/networking/api_factory.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource {
  final ApiFactory api;

  ProductsDataSourceImpl(this.api);

  @override
  Future<Either<Failure, List<ProductDM>>> productsOnlineDataSource() async {
    final serverResponse = api.get(ApiConstants.productsEndPoint);

    ProductResponse productResponse = ProductResponse.fromJson(serverResponse);

    if (productResponse.products != null) {
      return Right(productResponse.products!);
    } else {
      return const Left(Failure(ApiConstants.apiDefaultErrorMessage));
    }
  }
}
