import 'package:flutter/material.dart';
import 'package:headless_commerce/product/service/extension/project_dio.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';
import 'package:headless_commerce/service/reqres_service.dart';
import 'package:headless_commerce/utils/loading_stateful.dart';

abstract class ReqresViewModel extends LoadingStatefull<StatefulWidget> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Products>? resources = [];
  Map<String?, List<Products>> groupedResources = {};

  @override
  initState() {
    super.initState();
    reqresService = ReqresService(service);

    fetch();
  }

  Future<void> fetch() async {
    changeLoading();
    resources = (await reqresService.fetchItems())?.products ?? [];

    // Unique elemanları seçmek için
    uniqueCategorySelected();

    changeLoading();
  }

  void uniqueCategorySelected() {
    groupedResources.clear();
    for (var product in resources!) {
      if (!groupedResources.containsKey(product.category)) {
        groupedResources[product.category!] = [];
      }
      groupedResources[product.category]!.add(product);
    }
  }
}
