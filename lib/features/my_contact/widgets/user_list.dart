import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {
        'name': 'Alice Smith',
        'email': 'alice@example.com',
        'phone': '01711111111',
        'address': 'Dhaka, Bangladesh',
        'initials': 'AS',
      },
      {
        'name': 'John Doe',
        'email': 'john@example.com',
        'phone': '01822222222',
        'address': 'Chittagong, Bangladesh',
        'initials': 'JD',
      },
      {
        'name': 'Sarah Khan',
        'email': 'sarah@example.com',
        'phone': '01933333333',
        'address': 'Khulna, Bangladesh',
        'initials': 'SK',
      },
      {
        'name': 'Michael Roy',
        'email': 'michael@example.com',
        'phone': '01644444444',
        'address': 'Rajshahi, Bangladesh',
        'initials': 'MR',
      },
      {
        'name': 'David Hasan',
        'email': 'david@example.com',
        'phone': '01555555555',
        'address': 'Sylhet, Bangladesh',
        'initials': 'DH',
      },
    ];

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 5, bottom: 20),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            child: Material(
              elevation: 3,
              color: AppColors.background,
              shadowColor: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),

                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    contact['initials']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                title: Text(
                  contact['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact['email']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      contact['phone']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                trailing: const Icon(
                  Icons.chevron_right,
                  size: 30,
                ),

                onTap: () {
                  context.push(
                    AppRoutes.contactDetails,
                    extra: contact,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}