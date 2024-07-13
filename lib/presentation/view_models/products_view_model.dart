import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:route_task/domain/use_cases/get_all_products_use_case.dart';
import 'package:route_task/presentation/view_models/base_states.dart';

import '../../data/models/failure.dart';
import '../../data/models/product_response/product_response.dart';

@injectable
class ProductsViewModel extends Cubit<BaseState> {
  ProductsViewModel(this.useCase) : super(BaseInitialState());
  final GetAllProductsUseCase useCase;

  void getProducts() async {
    emit(BaseLoadingState());
    Either<Failure, List<ProductDM>> response = await useCase.execute();
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (products) => emit(BaseSuccessState<List<ProductDM>>(data: products)));
  }

  String getTheOriginalPrice(
      num discountPercentage, double priceAfterDiscount) {
    double percentOfDiscountedPriceFromOriginal =
        (100 - discountPercentage) / 100;
    double originalPrice =
        priceAfterDiscount / percentOfDiscountedPriceFromOriginal;
    return priceFormat((originalPrice * 10).roundToDouble() / 10);
  }

  String priceFormat(num price) {
    if (price >= 1000) {
      return NumberFormat('#,##0.0').format((price));
    } else {
      return NumberFormat('###.00').format((price));
    }
  }
}
