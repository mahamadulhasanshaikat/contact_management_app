import 'package:contact_management_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Add Contact", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.appbar,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle),
            iconSize: 35,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(child: Column(children: [

        
      ],)),
    );
  }
}
