import 'package:flutter/material.dart';
import 'package:flutter_demos/dynamic_form_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Forms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const DynamicFormScreen(),
    );
  }
}

