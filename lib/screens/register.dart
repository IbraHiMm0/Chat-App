import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom-TextField.dart';
import '../components/customButton.dart';
import '../helper/show_snack.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    bool isLoading=false;

    GlobalKey<FormState> formKey= GlobalKey();
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
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: const [
                    Text(
                      'Sign-Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                customField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                customField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 30.0,
                ),
                customButton(
                    text: 'Register',
                    onTap: () async {
                      if(formKey.currentState!.validate()){
                        isLoading=true;
                        setState(() {

                        });
                        try {
                          await RegisterUser(email, password);
                          Navigator.pushNamed(context, chatPage.id);
                        } on FirebaseAuthException
                        catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context,'The password provided is too weak');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context,'The account already exists for that email.');
                          }
                          isLoading=false;
                          setState(() {

                          });
                        }
                      }
                    }
                  ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have an account ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    )
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


  Future<void> RegisterUser(String? email, String? password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
