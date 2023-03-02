import 'package:flutter/material.dart';
import 'package:invoice_sorter/page/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Invoice Sorter",
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
