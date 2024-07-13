import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/data/models/product_response/product_response.dart';
import 'package:route_task/domain/repos/products_repo.dart';

@injectable
class GetAllProductsUseCase {
  final ProductsRepo repo;

  const GetAllProductsUseCase(this.repo);

  Future<Either<Failure, List<ProductDM>>> execute() {
    return repo.getProducts();
  }
}
