import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/data/models/product_response/product_response.dart';

import 'product_widget.dart';

class ProductsList extends StatelessWidget {
  final List<ProductDM> products;

  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return ProductWidget(
              product: products[index],
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
