import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../core/widgets/custom_dialog.dart';
import '../../models/contact_model.dart';
import '../../viewmodels/contact_viewmodel.dart';
import 'widgets/contact_info.dart';

class ContactDetailsPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailsPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final vm = ContactViewModel.instance;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListenableBuilder(
      listenable: vm,
      builder: (context, _) {
        final currentContact = vm.contacts.firstWhere(
          (c) => c.id == contact.id,
          orElse: () => contact,
        );

        final initials = currentContact.name.trim().isNotEmpty
            ? currentContact.name
                  .trim()
                  .split(' ')
                  .map((e) => e.isNotEmpty ? e[0] : '')
                  .take(2)
                  .join()
                  .toUpperCase()
            : 'U';

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Contact Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: isDark ? AppColors.darkAppbar : AppColors.appbar,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                onPressed: () => vm.toggleFavorite(currentContact),
                icon: Icon(
                  currentContact.isFavorite == 1
                      ? Icons.star
                      : Icons.star_border,
                  color: currentContact.isFavorite == 1
                      ? Colors.amber
                      : Colors.white,
                  size: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push(AppRoutes.editContact, extra: currentContact);
                },
                icon: Icon(Icons.edit_outlined, size: 24),
              ),

              //CustomDialog
              IconButton(
                onPressed: () {
                  CustomDialog.showConfirmationDialog(
                    context: context,
                    title: 'Delete Contact',
                    message: 'Are you sure you want to delete',
                    highlightedText: currentContact.name,
                    highlightColor: AppColors.primary,
                    confirmText: 'Delete',
                    icon: Icons.delete_outline,
                    iconColor: AppColors.danger,
                    onConfirm: () async {
                      if (currentContact.id != null) {
                        await vm.deleteContact(currentContact.id!);
                      }
                      if (context.mounted) {
                        context.pop();
                      }
                    },
                  );
                },
                icon: Icon(Icons.delete_outline, size: 24),
              ),

              SizedBox(width: 4),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      initials,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    currentContact.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.text,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: isDark ? 0.25 : 0.04,
                          ),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ContactInfoTile(
                          icon: Icons.phone_outlined,
                          value: currentContact.phone.isNotEmpty
                              ? currentContact.phone
                              : 'Not provided',
                          label: 'Mobile',
                          isDark: isDark,
                        ),
                        Divider(
                          height: 32,
                          thickness: 0.8,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.border,
                        ),
                        ContactInfoTile(
                          icon: Icons.email_outlined,
                          value: currentContact.email.isNotEmpty
                              ? currentContact.email
                              : 'Not provided',
                          label: 'Email',
                          isDark: isDark,
                        ),
                        Divider(
                          height: 32,
                          thickness: 0.8,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.border,
                        ),
                        ContactInfoTile(
                          icon: Icons.location_on_outlined,
                          value: currentContact.address.isNotEmpty
                              ? currentContact.address
                              : 'Not provided',
                          label: 'Address',
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
