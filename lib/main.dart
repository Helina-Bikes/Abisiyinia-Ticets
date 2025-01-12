import 'package:abyssinia_tickets/firebase_options.dart';
import 'package:abyssinia_tickets/widgets/homepage.dart';
import 'package:abyssinia_tickets/widgets/login.dart';
import 'package:abyssinia_tickets/widgets/ticket.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        snackBarTheme: SnackBarThemeData(backgroundColor: Colors.red)
      ),
      home: HomePage(),
    );
  }
}
