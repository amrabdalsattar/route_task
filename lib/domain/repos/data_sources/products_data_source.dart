import 'package:dartz/dartz.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/data/models/product_response/product_response.dart';

abstract class ProductsDataSource {
  Future<Either<Failure, List<ProductDM>>> productsOnlineDataSource();
}
