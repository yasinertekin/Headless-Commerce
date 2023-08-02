import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomCard/resource_card.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';
import 'package:headless_commerce/styles/colors.dart';

class CategoryListScreen extends StatelessWidget {
  final List<Products> products;
  final String categoryTitle; // Kategori başlığı eklendi

  const CategoryListScreen({Key? key, required this.products, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor().illuminatingEmerald,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppBarItem(
                icon: Icons.sort_rounded,
                appBarItemTitle: 'Sort by',
              ),
              AppBarItem(
                icon: Icons.location_on_rounded,
                appBarItemTitle: 'Location',
              ),
              AppBarItem(
                icon: Icons.category_rounded,
                appBarItemTitle: 'Category',
              ),
            ],
          ),
        ),
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                color: MyColor().white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Products product = products[index];
          return ResourceCard(
            thumbnailUrl: product.thumbnail ?? '',
            title: product.title ?? '',
            price: product.price?.toDouble() ?? 0,
          );
        },
      ),
    );
  }
}

class AppBarItem extends StatelessWidget {
  AppBarItem({
    super.key,
    required this.icon,
    required this.appBarItemTitle,
  });
  IconData icon;
  final String appBarItemTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: MyColor().white,
        backgroundColor: MyColor().illuminatingEmerald,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: MyColor().white, width: 1),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(icon),
          Text(
            appBarItemTitle,
          ),
        ],
      ),
    );
  }
}
