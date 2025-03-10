import 'package:flutter/material.dart';
import 'package:halal_vest/halal_vest_home_page.dart';

void main() {
  runApp(const HalalVest());
}

class HalalVest extends StatelessWidget {
  const HalalVest({super.key});

  // Root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HalalVest Page Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HalalVestHomePage(),
    );
  }
}
