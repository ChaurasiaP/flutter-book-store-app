import 'package:flutter/material.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({super.key});

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
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
                  const Text("Items in your cart", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
