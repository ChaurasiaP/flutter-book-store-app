import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    children: [
                      SizedBox(height: 30),

                      Text("ALL BOOKS", style: TextStyle(
                          fontSize: 18
                      )),
                      Text("(250 books)", style: TextStyle(
                          fontSize: 10, color: Colors.grey
                      ),)]
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
    );
  }
  Widget _itemsList() =>
      MasonryGridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          itemCount: 20,
          itemBuilder: (context, index) =>
              InkWell(
                onHover: (value){},
                onTap: (){},

                // item box containing image, description, price and action buttons
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.black12)
                  ),
                  height: 350,
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemImage(),
                      Padding(padding: const EdgeInsets.all(10),
                          child: _itemDetails()),
                      isTapped ? _addedToCart() : _actionButtons()

                    ],
                  ),
                ),
              )
      );

  Widget _itemImage() =>
      Container(  // CONTAINS IMAGE OF THE PRODUCT
        color: Colors.grey[300],
        height: 180,
      );

  Widget _itemDetails() =>
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Book Name", style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600
          ),),
          Text("author", style: TextStyle(
              color: Colors.grey
          ),),
          Text("Published in: ", style: TextStyle(
              color: Colors.grey
          ),),
          Text("Rs. 1500", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),)
        ],
      );

  Widget _actionButtons() =>
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
              child:const Icon(Icons.add_shopping_cart)),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade400)
              ),
              onPressed: (){},
              child: const Icon(FontAwesomeIcons.heart))
        ],
      );

  Widget _addedToCart() =>
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
