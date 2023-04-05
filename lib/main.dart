import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/loginScreen.dart';
import 'package:chatapp/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage':(context)=>LoginScreen(),
        'RegisterPage':(context)=>registerScreen(),
        chatPage.id:(context)=>chatPage(),

      },
      initialRoute: 'LoginPage',
    );
  }
}
