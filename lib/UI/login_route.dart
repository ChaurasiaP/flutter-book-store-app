import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/sign_up_route.dart';
import 'package:book_store_app/services/shared_pref.dart';
import 'package:book_store_app/style/text_field_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => ());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.tealAccent[300],
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          child: Column(
            children: [
              const Icon(Icons.lock, size: 125, color: Colors.black),
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    //email input
                    TextField(
                        controller: emailController,
                        decoration: textBoxDecoration("Enter Email")),

                    // password input
                    TextField(
                      controller: passwordController,
                      decoration: textBoxDecoration("Enter Password"),
                      obscureText: true,
                      obscuringCharacter: '*',
                    ),

                    // action buttons
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // sign in
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: _checkCredentials, child: const Text("Sign in")),
                          ElevatedButton(onPressed: (){}, child: const Text( "Forgot Password"))
                        ],
                      ),
                    ),
                    // sign up
                    const SizedBox(height: 25),
                    const Text("Not registered Yet!"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                      }, child: const Text("Sign Up")),
                    ),
                    // social sign in options
                    const SizedBox(height: 25),
                    const Text("or Sign in using", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.google, color: Colors.blue, semanticLabel: "Google",)),
                          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.phone, color: Colors.blue, semanticLabel: "Phone Number")),
                          // IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.apple, color:  Colors.blue, semanticLabel: "Apple ID"))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _splashScreen() =>
      Center(
        child: Image.asset("imgs/bookstore_logo.png"),
      );
  void _checkCredentials() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((_) => LocalDataSaver.saveLogData(true));
      debugPrint("USER LOGGED IN");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
    }on FirebaseAuthException catch(ex){
      debugPrint(ex.code.toString());
    }
  }
}
