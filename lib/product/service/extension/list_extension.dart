extension UniqueCategoriesMapExtension on List<Map<String, dynamic>> {
  Map<String, dynamic> get category {
    // Benzersiz kategorileri saklamak için bir harita oluşturun
    Map<String, dynamic> uniqueCategoriesMap = {};

    // Döngü ile listedeki öğeleri gezin
    for (var item in this) {
      // Her bir öğenin "category" özelliğini alın
      String category = item["category"];

      // Eğer bu kategori daha önce eklenmemişse, haritaya ekle
      if (!uniqueCategoriesMap.containsKey(category)) {
        uniqueCategoriesMap[category] = item;
      }
    }

    return uniqueCategoriesMap;
  }
}
