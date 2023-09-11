import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // title bar
            Container(
              color: Colors.orange[400],
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.14,
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_rounded, color: Colors.black,))),
                  Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(color: Colors.black54, width: 0.5)
                    ),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search your books")),
                          ),
                          Icon(Icons.search),
                          // S
                        ]
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.14,
                      child: const InkWell(
                          child: Icon(Icons.shopping_cart_outlined, color: Colors.black,)))
                ],
              ),
            ) // title bar ends
          ],
        ),
      ),
    );
  }

}
