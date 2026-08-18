import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../viewmodels/contact_viewmodel.dart';

class UserList extends StatelessWidget {
  final ContactViewModel viewModel;

  const UserList({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final displayList = viewModel.searchQuery.isNotEmpty
        ? viewModel.filteredContacts
        : viewModel.contacts;

    if (displayList.isEmpty) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_search_outlined, size: 70, color: Colors.grey.shade400),
              const SizedBox(height: 12),
              Text(
                viewModel.searchQuery.isNotEmpty
                    ? 'No contacts found'
                    : 'No contacts yet',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: displayList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final contact = displayList[index];
          final initials = contact.name.trim().isNotEmpty
              ? contact.name.trim().split(' ').map((e) => e.isNotEmpty ? e[0] : '').take(2).join().toUpperCase()
              : 'U';

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primary.withOpacity(0.9),
                child: Text(
                  initials,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (contact.email.isNotEmpty)
                    Text(contact.email, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  Text(contact.phone, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                context.push(AppRoutes.contactDetails, extra: contact);
              },
            ),
          );
        },
      ),
    );
  }
}