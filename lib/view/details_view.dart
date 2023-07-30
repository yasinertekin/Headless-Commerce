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
          title: const Text('Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.productCatalogModel.title ?? ''),
            ],
          ),
        ));
  }
}
