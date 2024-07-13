import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/data/models/product_response/product_response.dart';
import 'package:route_task/presentation/view_models/products_view_model.dart';

import 'product_widget.dart';

class ProductsList extends StatelessWidget {
  final List<ProductDM> products;
  final ProductsViewModel viewModel;

  const ProductsList(
      {super.key, required this.products, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return ProductWidget(
              product: products[index],
              viewModel: viewModel,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.79,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w)),
    );
  }
}
