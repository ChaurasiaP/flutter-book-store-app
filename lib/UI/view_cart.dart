import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/settings_route.dart';
import 'package:book_store_app/UI/user_account_route.dart';
import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({super.key});

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {

  bool isOrderPlaced = false;
  bool isConfirmed = false;
  int onIndex = 2;
  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: SingleChildScrollView(
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
              Column(
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
                                  child: Image.asset("assets/images/img18.jpg", fit: BoxFit.cover,)),
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
                  Visibility(
                    visible: isOrderPlaced,
                    child: Column(
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
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container( // user's full name input
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
                                  Container( // user's phone number
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
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container( // pin code
                                    height: size.height*0.04,
                                    width: size.width*0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Pin Code",
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container( // locality
                                    height: size.height*0.04,
                                    width: size.width*0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Locality",
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container( // address
                                    height: size.height*0.1,
                                    width: size.width*0.938,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          hintText: "Delivery Address",
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container( // city
                                    height: size.height*0.04,
                                    width: size.width*0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          hintText: "City",
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container( // landmark
                                    height: size.height*0.04,
                                    width: size.width*0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Nearby Landmark",
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          isConfirmed = true;
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(Colors.orange[700])
                                      ),
                                      child: const Text('Confirm Your Purchase')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: isConfirmed,
                    child: Container(
                      height: size.height*0.30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text("Order Review", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
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
                                    child: Image.asset("assets/images/img18.jpg", fit: BoxFit.cover,)),
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
                                  SizedBox(height: 20),
                                  Text("Rs. 1100/-", style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ],
                          ),
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
                                    child: const Text("Checkout")),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            onIndex = index;
          });
        },
        currentIndex: onIndex,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: const MainScreen(), type: PageTransitionType.leftToRightWithFade));},
                  child: const Icon(Icons.home_outlined, color: Colors.black)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(child: const UserAccount(), type: PageTransitionType.leftToRightWithFade));
                },
              child: const Icon(Icons.person_outline, color: Colors.black)),
              label: "Account"),
          BottomNavigationBarItem(icon: InkWell(
              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCart())),
              child: const Icon(Icons.shopping_cart_outlined, color: Colors.black)), label: "View Cart"),
          BottomNavigationBarItem(icon: InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(child: const SettingsRoute(), type: PageTransitionType.rightToLeftWithFade));
              },
              child: const Icon(Icons.menu_outlined, color: Colors.black)), label: "Menu")
        ],
      ),    );
  }
}
