import 'package:book_store_app/UI/login_route.dart';
import 'package:book_store_app/services/shared_pref.dart';
import 'package:book_store_app/style/text_field_style.dart';
import 'package:book_store_app/style/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.tealAccent[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                height: MediaQuery.of(context).size.height*0.065,
                width: MediaQuery.of(context).size.width,
                child: Text("Join The Bugs!!", style: titleBarText()),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    const Icon(Icons.person_add, size: 130,),
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                      child: Column(
                        children: [
                          TextField(
                              controller: firstNameController,
                              decoration: textBoxDecoration("First Name","Your First Name")
                          ),
                          TextField(
                              controller: lastNameController,
                              decoration: textBoxDecoration("Last Name", "Your Last Name")
                          ),
                          TextField(
                              controller: emailController,
                              decoration: textBoxDecoration("Email", "Enter Email")
                          ),
                          TextField(
                              controller: passwordController,
                              decoration: textBoxDecoration("Password", "Enter Password"),
                            obscureText: true,
                            obscuringCharacter: '*',
                          ),
                          ElevatedButton(onPressed: _createUser, child: const Text("Click to confirm"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _createUser() async{
    String email = emailController.text.trim();
    String password = passwordController.text;

    try{
      String fname = firstNameController.text;
      String lname = lastNameController.text;
      String? displayName ="$fname $lname";

      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
      LocalDataSaver.saveFirstName(fname);
      LocalDataSaver.saveLastName(lname);
      debugPrint("USER CREATED");
      debugPrint(FirebaseAuth.instance.currentUser!.displayName);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
    }on FirebaseAuthException catch(ex){
      debugPrint(ex.code.toString());
    }
  }
}
