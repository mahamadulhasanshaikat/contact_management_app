import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool isDark;

  const ContactInfoTile({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : AppColors.text,
                ),
              ),
              SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? Colors.white54 : AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
