import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

            child: Material(
              elevation: 3,
              color: AppColors.background,
              shadowColor: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "AS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                title: Text(
                  "Alice Smith",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("alice@example.com", style: TextStyle(fontSize: 14)),
                    Text(
                      "01711111111",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.chevron_right, size: 30),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
