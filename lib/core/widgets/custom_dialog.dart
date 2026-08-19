import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../constants/app_legal_info.dart';

class CustomDialog {
  CustomDialog._();
  // Dialog (Delete, Cancel, Actions)
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? highlightedText, // কালার করার জন্য নাম/টেক্সট
    Color? highlightColor, // হাইলাইট টেক্সটের কালার
    required String confirmText,
    required VoidCallback onConfirm,
    IconData icon = Icons.delete_outline,
    Color iconColor = AppColors.danger,
    String cancelText = 'Cancel',
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dialogWidth = MediaQuery.sizeOf(context).width * 0.85;

    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 40),
              ),
              SizedBox(height: 18),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: isDark ? Colors.white : AppColors.text,
                ),
              ),
              SizedBox(height: 10),

              Text.rich(
                TextSpan(
                  text: message,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : AppColors.mutedText,
                    fontSize: 15,
                    height: 1.4,
                  ),
                  children: [
                    if (highlightedText != null)
                      TextSpan(
                        text: '\n$highlightedText',
                        style: TextStyle(
                          color: highlightColor ?? AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    TextSpan(text: '?'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.border,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(dialogCtx, rootNavigator: true).pop(),
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white70 : AppColors.text,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: iconColor,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(dialogCtx, rootNavigator: true).pop();
                        onConfirm();
                      },
                      child: Text(
                        confirmText,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // About App Dialog
  static void showAppAboutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dialogWidth = MediaQuery.sizeOf(context).width * 0.85;

    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  Icons.contacts_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 16),
              Text(
                AppLegalInfo.appName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: isDark ? Colors.white : AppColors.text,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'v${AppLegalInfo.appVersion}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white54 : AppColors.mutedText,
                ),
              ),
              SizedBox(height: 14),
              Text(
                AppLegalInfo.appDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: isDark ? Colors.white70 : AppColors.text,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppColors.primary, width: 1.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(dialogCtx, rootNavigator: true).pop();
                    context.push(AppRoutes.licenses);
                  },
                  child: Text(
                    'View Licenses & Legal',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
