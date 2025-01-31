import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication/firebase_options.dart';
import 'package:phone_authentication/screens/email_auth/login_screen.dart';
import 'package:phone_authentication/screens/email_auth/signup_screen.dart';
import 'package:phone_authentication/screens/phone_auth/home_screen.dart';
import 'package:phone_authentication/screens/phone_auth/signin_with_phone.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:(FirebaseAuth.instance.currentUser != null )? HomeScreen():SigninWithPhone()
    );
  }
}

