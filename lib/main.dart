import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/presentation/screens/products_screen/products_screen.dart';
import 'package:route_task/utils/app_themes.dart';

import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        theme: AppThemes.appTheme,
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        home: const ProductsScreen(),
      ),
    );
  }
}
