import 'package:flutter/material.dart';
import 'package:headless_commerce/product/service/extension/project_dio.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';
import 'package:headless_commerce/service/reqres_service.dart';
import 'package:headless_commerce/utils/loading_stateful.dart';

abstract class ReqresViewModel extends LoadingStatefull<StatefulWidget> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Products>? resources = [];
  List<Products>? uniqueResources = [];

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
    uniqueResources = getUniqueResources(resources);

    changeLoading();
  }
}

List<Products> getUniqueResources(List<Products>? resources) {
  // Benzersiz kategorileri saklamak için bir harita oluşturun
  Map<String, Products> uniqueCategoriesMap = {};

  // Döngü ile listedeki öğeleri gezin
  for (var item in resources ?? []) {
    // Her bir öğenin "category" özelliğini alın
    String category = item.category ?? '';

    // Eğer bu kategori daha önce eklenmemişse, haritaya ekle
    if (!uniqueCategoriesMap.containsKey(category)) {
      uniqueCategoriesMap[category] = item;
    }
  }

  return uniqueCategoriesMap.values.toList();
}
