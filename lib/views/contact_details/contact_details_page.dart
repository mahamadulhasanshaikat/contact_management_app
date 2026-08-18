import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class ContactDetailsPage extends StatelessWidget {
  final Map<String, dynamic> contact;

  const ContactDetailsPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Contact Details',
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
            onPressed: () {
              // Edit contact
            },
            icon: const Icon(Icons.edit_outlined, size: 25),
          ),

          IconButton(
            onPressed: () {
              // Delete contact
            },
            icon: const Icon(Icons.delete_outline, size: 25),
          ),

          const SizedBox(width: 4),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Profile
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.primary,
                child: Text(
                  contact['initials'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Name
              Text(
                contact['name'] ?? '',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 38),

              // Contact Information Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildContactInfo(
                      icon: Icons.phone,
                      value: contact['phone'] ?? '',
                      label: 'Mobile',
                    ),

                    const SizedBox(height: 25),

                    _buildContactInfo(
                      icon: Icons.email,
                      value: contact['email'] ?? '',
                      label: 'Email',
                    ),

                    const SizedBox(height: 25),

                    _buildContactInfo(
                      icon: Icons.location_on,
                      value: contact['address'] ?? '',
                      label: 'Address',
                    ),
                  ],
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 38,
          child: Icon(icon, color: const Color(0xFF62666F), size: 24),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF252525),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                label,
                style: const TextStyle(fontSize: 13, color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
