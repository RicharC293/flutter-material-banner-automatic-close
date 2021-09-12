import 'package:flutter/material.dart';
import 'package:flutter_test_2_5/pages/home_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda página"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomePage())),
          child: const Text('Return to home'),
        ),
      ),
    );
  }
}
