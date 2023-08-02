import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/components/CustomCard/resource_card.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/category_screen.dart';
import 'package:headless_commerce/view/details_view.dart';

import 'package:headless_commerce/widget/LoadingScreen/loading_screen.dart';

import '../viewModel/req_res_view_model.dart';

class HomeDashbord extends StatefulWidget {
  const HomeDashbord({Key? key}) : super(key: key);

  @override
  _HomeDashbordState createState() => _HomeDashbordState();
}

class _HomeDashbordState extends ReqresViewModel with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final String _title = 'Home Dashbord';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? const Center(child: LoadingScreen())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: MyColor().illuminatingEmerald,
              title: Text(_title),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _HorizontalImageList(resources: resources),
                      _ThumNailGrid(
                        groupedResources: groupedResources.map((key, value) => MapEntry(key!, value)),
                      ),
                      const _BuildNewProductHeader(),
                      buildHorizontalResourceList(context),
                    ],
                  );
                },
              ),
            ),
          );
  }

  SizedBox buildHorizontalResourceList(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: resources?.length ?? 0,
        itemBuilder: (context, index) {
          return ResourceCard(
            thumbnailUrl: resources?[index].thumbnail ?? '',
            title: resources?[index].title ?? '',
            price: resources?[index].price?.toDouble() ?? 0,
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _BuildNewProductHeader extends StatelessWidget {
  const _BuildNewProductHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'New Product',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.04,
            child: CustomButton(
                onPressed: () {},
                backgroundColor: MyColor().illuminatingEmerald,
                buttonText: 'See All',
                textColor: MyColor().white),
          ),
        ],
      ),
    );
  }
}

class _ThumNailGrid extends StatelessWidget {
  const _ThumNailGrid({
    required this.groupedResources,
  });

  final Map<String, List<Products>> groupedResources;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Yatayda tek sütun olacak
        ),
        itemCount: groupedResources.length,
        itemBuilder: (context, index) {
          String category = groupedResources.keys.elementAt(index);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryListScreen(products: groupedResources[category] ?? [], categoryTitle: category),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: _CategoryHeader(groupedResources: groupedResources, category: category),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({
    required this.groupedResources,
    required this.category,
  });

  final Map<String, List<Products>> groupedResources;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Image.network(
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.20,
            groupedResources[category]?[0].thumbnail ?? '',
            color: Colors.black.withOpacity(0.3), // Siyah filtre için renk ve opaklık belirleyin
            colorBlendMode: BlendMode.darken, // Renk karıştırma modunu seçin
          ),
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            category,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyColor().white,
                ),
          ),
        ),
      ],
    );
  }
}

class _HorizontalImageList extends StatefulWidget {
  const _HorizontalImageList({
    required this.resources,
  });

  final List<Products>? resources;

  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends ReqresViewModel with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: resources?.length ?? 0,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                navigatoToWidget(
                  context,
                  DetailsView(
                    productCatalogModel: resources?[index] ?? Products(),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(resources?[index].thumbnail ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
