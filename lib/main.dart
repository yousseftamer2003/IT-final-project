import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/controller/provider.dart';
import 'package:hacker_rank_final/it_module/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HackerRankApp());
}

class HackerRankApp extends StatelessWidget {
  const HackerRankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> TaskProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )
      );
  }
}
