import 'package:flutter/material.dart';
import 'package:contact_management_app/app/theme/app_colors.dart';

class DrawerItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDark;
  final bool isSelected;
  final Color? iconColor;
  final Color? textColor;

  const DrawerItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isDark,
    this.isSelected = false,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveIconColor = iconColor ?? AppColors.primary;
    final Color effectiveTextColor =
        textColor ?? (isDark ? Colors.white : Color(0xFF252525));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: isSelected
            ? AppColors.primary.withValues(alpha: isDark ? 0.18 : 0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? effectiveIconColor.withValues(alpha: 0.15)
                        : (isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.black.withValues(alpha: 0.04)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: effectiveIconColor, size: 20),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: effectiveTextColor,
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
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
