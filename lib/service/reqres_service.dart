import 'dart:io';

import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';
import 'package:headless_commerce/viewModel/req_res_view_model.dart';

abstract class IReqresService extends ReqresViewModel {
  IReqresService(this.dio);

  final Dio dio;

  Future<ProductCatalogModel?> fetchItems();
}

enum _ReqresPath {
  resource,
}

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<ProductCatalogModel?> fetchItems() async {
    final response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is Map<String, dynamic>) {
        return ProductCatalogModel.fromJson(datas);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
