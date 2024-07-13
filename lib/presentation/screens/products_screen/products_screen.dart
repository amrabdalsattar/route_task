import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/domain/di/di.dart';
import 'package:route_task/presentation/view_models/base_states.dart';
import 'package:route_task/presentation/view_models/products_view_model.dart';

import '../../shared_components/loading_widget.dart';
import 'components/custom_app_bar.dart';
import 'components/products_components/products_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  void initState() {
    viewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: const CustomAppBar(),
      ),
      body: BlocBuilder<ProductsViewModel, BaseState>(
        bloc: viewModel,
        builder: (context, state){
          switch (state) {
            case BaseLoadingState():
              return const LoadingWidget();

            case BaseErrorState():
              return Text(state.errorMessage);

            case BaseSuccessState():
              return ProductsList(products: state.data);

            default:
              return const Text("Something went Wrong");
          }
        },
      ),
    );
  }
}
