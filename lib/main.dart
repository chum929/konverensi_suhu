import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/suhu_provider.dart';
import 'pages/konversi_suhu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SuhuProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: KonversiSuhuPage(),
    );
  }
}