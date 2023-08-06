import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomCard/resource_card.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/viewModel/req_res_view_model.dart';
import 'package:headless_commerce/widget/LoadingScreen/loading_screen.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends ReqresViewModel with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Browse',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: MyColor().white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, color: MyColor().white, size: 24),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(MyColor().white),
                              iconColor: MaterialStateProperty.all<Color>(MyColor().white),
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_basket_outlined),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: SearchBar(),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              leading: const SizedBox.shrink(),
              actions: const [],
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.vertical,
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

//SearchBar

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(Icons.search, color: MyColor().illuminatingEmerald),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
