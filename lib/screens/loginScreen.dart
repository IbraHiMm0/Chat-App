import 'package:chatapp/components/custom-TextField.dart';
import 'package:chatapp/components/customButton.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
  String? email;
  String? password;
  bool isLoading=false;
  GlobalKey<FormState> formKey= GlobalKey();

class _LoginScreenState extends State<LoginScreen> {
  @override

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 80.0,
                ),
                const Image(
                  image: NetworkImage(
                    'https://www.lehrer-online.de/fileadmin/user_upload/Icons/Icons_LO_blau/0455-bubbles4.png'
                  ),
                  height: 130.0,
                  width: 130.0,
                ),
                const Text(
                  'iChat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontFamily: 'Lib',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: const [
                    Text(
                      'Sign-In',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                customField(
                  hintText: 'Email',
                  onChanged: (p0) {
                    email=p0;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                customField(
                  obs: true,
                  hintText: 'Password',
                  onChanged: (p0) {
                    password=p0;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                customButton(
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser(email, password);
                        Navigator.pushNamed(context, chatPage.id,arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'User Not Found ,Try Again');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user,Try Again');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> loginUser(String? email, String? password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
