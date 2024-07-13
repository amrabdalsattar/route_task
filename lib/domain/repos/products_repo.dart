import 'package:dartz/dartz.dart';

import '../../data/models/failure.dart';
import '../../data/models/product_response/product_response.dart';

abstract class ProductsRepo {
  Either<Failure, List<ProductDM>> getProducts();
}
