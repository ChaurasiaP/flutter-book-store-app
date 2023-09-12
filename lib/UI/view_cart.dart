import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({super.key});

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {

  bool isOrderPlaced = false;
  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // title bar
            Container(
              color: Colors.orange[400],
              height: size.height*0.07,
              width: size.width,
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
                    height: size.height*0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text("My Cart: 2", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Container(
                              height: size.height*0.17,
                              decoration: const  BoxDecoration(
                                  color: Colors.pink
                              ),
                              child: SizedBox(
                                  width: size.width*0.28,
                                  child: Image.asset("imgs/books/img18.jpg", fit: BoxFit.cover,)),
                              ),
                            const SizedBox(width: 30),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Book Name", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700
                                ),),
                                SizedBox(height: 10),
                                Text("author name",style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey
                                ),),
                                SizedBox(height: 30),
                                Text("Rs. 1100/-", style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            const SizedBox(width: 30),
                            const Column(
                              children: [
                                Text("add more")
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      isOrderPlaced = true;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.orange[700])
                                  ),
                                  child: const Text("Place Order")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: size.height*0.4,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 2, color: Colors.black)
                        ),

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Customer Details", style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold
                            )),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(// user's full name inputp
                                  height: size.height*0.04,
                                  width: size.width*0.45,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Full Name",
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: size.height*0.04,
                                  width: size.width*0.45,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: const TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "Enter Phone Number",
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
