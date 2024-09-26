import 'package:flutter/material.dart';
import 'package:practice_with_ostad/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("home"),
      ),
      drawer: const Sidebar(),
    );
  }
}

