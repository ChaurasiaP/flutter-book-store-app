import 'package:book_store_app/services/resources/books_list.dart';
import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDemo extends StatefulWidget {
  const ShimmerDemo({super.key});

  @override
  State<ShimmerDemo> createState() => _ShimmerDemoState();
}

class _ShimmerDemoState extends State<ShimmerDemo> {
  List<Books> itemList = [];

  fetchBookList() {
    itemList = Books.getBookDetails();
  }

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBookList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            titleBar(context),
            const SizedBox(height: 15),
            Expanded(
              child: MasonryGridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white70, border: Border.all(color: Colors.black12)),
                          height: 250,
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.grey[300],
                                height: 120,
                              ),
                              const SizedBox(height: 5),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 12,
                                        width: 120,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 12,
                                        width: 100,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 12,
                                        width: 100,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 12,
                                        width: 100,
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 20),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 24,
                                            width: 50,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 20),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 24,
                                            width: 50,
                                            color: Colors.grey,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ) ,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
