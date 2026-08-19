import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../models/contact_model.dart';
import '../../viewmodels/contact_viewmodel.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _handleSaveContact() async {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final address = _addressController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a name')));
      return;
    }

    if (phone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a phone number')));
      return;
    }

    final newContact = Contact(
      name: name,
      phone: phone,
      email: email,
      address: address,
      isFavorite: 0,
    );

    await ContactViewModel.instance.addContact(newContact);

    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Add Contact",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: isDark ? Color(0xFF1E1E1E) : AppColors.appbar,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle),
            iconSize: 32,
            color: Colors.white,
            onPressed: _handleSaveContact,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(
                        alpha: isDark ? 0.20 : 0.10,
                      ),
                      border: Border.all(
                        color: AppColors.primary.withValues(
                          alpha: isDark ? 0.40 : 0.25,
                        ),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                ),

                //Nmae
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your name',
                  prefixIcon: Icons.person_outline_rounded,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 14),
                //phone
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'Enter phone number',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 14),
                //email
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter email address',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(height: 14),
                //address
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Enter address',
                  prefixIcon: Icons.location_on_outlined,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                ),

                SizedBox(height: 25),
                //Button
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CustomButton(
                    text: 'Save Contact',
                    icon: Icons.save_outlined,
                    onPressed: _handleSaveContact,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
