import 'package:contact_app/core/routes/app_routes.dart';
import 'package:contact_app/feature/view/screens/home_screen.dart';
import 'package:contact_app/feature/view/screens/new_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.home,
      routes:{
        AppRoute.home: (context) =>  HomeScreen(),
        AppRoute.newContact: (context) => NewContactScreen(),
      }
    );
  }
}