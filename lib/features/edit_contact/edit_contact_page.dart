import 'package:flutter/material.dart';
import 'package:contact_management_app/app/theme/app_colors.dart';
import 'package:contact_management_app/core/constant/custom_button.dart';
import 'package:contact_management_app/core/constant/custom_textfield.dart';

class EditContactPage extends StatefulWidget {
  final Map<String, dynamic> contact;

  const EditContactPage({super.key,  required this.contact});

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.contact['name'] ?? '');

    phoneController = TextEditingController(
      text: widget.contact['phone'] ?? '',
    );

    emailController = TextEditingController(
      text: widget.contact['email'] ?? '',
    );

    addressController = TextEditingController(
      text: widget.contact['address'] ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Edit Contact',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.appbar,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: _updateContact,
            icon: const Icon(Icons.check_rounded, size: 28),
          ),
          const SizedBox(width: 5),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: Column(
            children: [
              // Camera
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.10),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primary,
                  size: 38,
                ),
              ),

              const SizedBox(height: 20),

              // Name
              CustomTextField(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: Icons.person_outline_rounded,
                keyboardType: TextInputType.name,
              ),

              // Phone
              CustomTextField(
                controller: phoneController,
                hintText: 'Phone Number',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),

              // Email
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              // Address
              CustomTextField(
                controller: addressController,
                hintText: 'Address',
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.streetAddress,
                textInputAction: TextInputAction.done,
                maxLines: 3,
              ),

              const SizedBox(height: 5),

              // Update Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButton(
                  text: 'Update Contact',
                  icon: Icons.check_rounded,
                  onPressed: _updateContact,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateContact() {
    // এখানে পরে ViewModel-এর মাধ্যমে update করবে

    final updatedContact = {
      ...widget.contact,
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'email': emailController.text.trim(),
      'address': addressController.text.trim(),
    };

    Navigator.pop(context, updatedContact);
  }
}
