import 'package:contact_management_app/app/theme/app_colors.dart';
import 'package:contact_management_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_textfield.dart';

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

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 25),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.10),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
            ),

            SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter your name',
              prefixIcon: Icons.person_outline_rounded,
              keyboardType: TextInputType.name,
            ),

            CustomTextField(
              hintText: 'Enter phone number',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),

            CustomTextField(
              hintText: 'Enter email address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            CustomTextField(
              hintText: 'Enter address',
              prefixIcon: Icons.location_on_outlined,
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.done,
              maxLines: 3,
            ),

            SizedBox(height: 10),
            //Buttom
            Padding(
              padding: EdgeInsets.all(15),
              child: CustomButton(
                text: 'Save Contact',
                icon: Icons.save_outlined,
                onPressed: () {
                  // Save contact
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
