import 'package:book_store_app/UI/view_cart.dart';
import 'package:book_store_app/services/resources/books_list.dart';
import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(const MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isHovered = false;
  bool isTapped = false;
  List<String> dropDownMenuList = ["Price: low to high",
    "Price: high to low",
    "relevence"
  ];
  List<Books> booksList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBooksList();
  }

  fetchBooksList(){
     booksList = Books.getBookDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            titleBar(context),
            const Column(
              children: [
                Row(
                    children: [SizedBox(height: 15),]
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(

              child: _itemsList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
  Widget _itemsList() =>
      MasonryGridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          itemCount: booksList.length,
          itemBuilder: (context, index) =>
              InkWell(
                splashColor: Colors.orangeAccent,
                onHover: (value){},
                onTap: (){

                },

                // item box containing image, description, price and action buttons
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.black12)
                  ),
                  height: 350,
                  width: 150,
                  child: InkWell(
                    onHover: (value){
                      Text(booksList[index].description);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _itemImage(index),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: const EdgeInsets.all(10),
                                child: _itemDetails(index)),
                          ],
                        ),
                        // isTapped ? _addedToCart(index) : _actionButtons(index)
                      ],
                    ),
                  ),
                ),
              )
      );

  Widget _itemImage(int index) =>
      Container(  // CONTAINS IMAGE OF THE PRODUCT
        color: Colors.grey[300],
        height: 180,
        child: Image.asset(booksList[index].image),
      );

  Widget _itemDetails(int index) =>
      Column(
        children: [
          Text(booksList[index].bookName, style: const TextStyle(

            overflow: TextOverflow.ellipsis,
              fontSize: 18, fontWeight: FontWeight.w600
          ),),
          Text(booksList[index].author, style: const TextStyle(
              color: Colors.grey
          ),),
          Text(booksList[index].publishedIn, style: const TextStyle(
              color: Colors.grey
          ),),
          Text(booksList[index].price, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange)
                  ),
                  onPressed: (){
                    setState(() {
                      isTapped = true;
                    });
                  },
                  child: const Icon(Icons.add_shopping_cart)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade400)
                  ),
                  onPressed: (){},
                  child: const Icon(FontAwesomeIcons.heart))
            ],
          )
        ],
      );

  // Widget _actionButtons(int index) =>
  //     // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     ElevatedButton(
      //         style: const ButtonStyle(
      //             backgroundColor: MaterialStatePropertyAll(Colors.orange)
      //         ),
      //         onPressed: (){
      //           setState(() {
      //             isTapped = true;
      //           });
      //         },
      //         child: const Icon(Icons.add_shopping_cart)),
      //     ElevatedButton(
      //         style: ButtonStyle(
      //             backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade400)
      //         ),
      //         onPressed: (){},
      //         child: const Icon(FontAwesomeIcons.heart))
      //   ],
      // );

  Widget _addedToCart(int index) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent.shade400)
              ),
              onPressed: (){},
              child: const Text("Added to Cart", style: TextStyle(
                  color: Colors.white
              ),)),
        ],
      );
}
