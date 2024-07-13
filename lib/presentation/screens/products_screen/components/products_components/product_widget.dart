import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/data/models/product_response/product_response.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../shared_components/loading_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductDM product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.liteBlue),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.thumbnail!,
                    placeholder: (_, __) => const LoadingWidget(),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      AppAssets.favouritesIcon,
                      color: AppColors.primary,
                      height: 15.h,
                      width: 15.w,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title ?? "",
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "EGP ${product.price ?? 0}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              "${product.discountPercentage}% OFF",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Review (${product.rating ?? 0})",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(width: 2.w,),
                              Image.asset(AppAssets.star)
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 28.w,
                            height: 25.h,
                            child: FloatingActionButton(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              onPressed: () {},
                              backgroundColor: AppColors.primary,
                              child: const Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
