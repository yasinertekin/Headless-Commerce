import 'package:flutter/material.dart';
import 'package:headless_commerce/service/product_catalog_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.productCatalogModel}) : super(key: key);
  final Products productCatalogModel;

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          //backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Stack(
              children: [
                Image.network(widget.productCatalogModel.thumbnail ?? ''),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [],
        ));
  }
}
