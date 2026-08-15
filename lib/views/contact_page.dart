import 'package:contact_management_app/constant/colors.dart';
import 'package:flutter/material.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: Text("My Contact", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.appbar,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(child: Column()),
    );
  }
}
