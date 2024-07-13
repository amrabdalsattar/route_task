import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PackagesModule {
  Dio getDio() => Dio();
}
