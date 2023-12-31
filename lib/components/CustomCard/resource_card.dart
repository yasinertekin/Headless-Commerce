import 'package:flutter/material.dart';
import 'package:headless_commerce/styles/colors.dart';

class ResourceCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final double price;

  const ResourceCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: 160,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.fill,
                  height: 100,
                  width: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                    ),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: MyColor().illuminatingEmerald),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tradly',
                      style: TextStyle(color: MyColor().gray),
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14,
                          color: MyColor().illuminatingEmerald,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
