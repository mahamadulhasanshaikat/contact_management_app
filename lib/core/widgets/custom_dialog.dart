import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../constants/app_legal_info.dart';

class CustomDialog {
  CustomDialog._();

  // ১. জেনেরিক কনফার্মেশন/অ্যাকশন ডায়ালগ (Delete, Logout ইত্যাদির জন্য)
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    IconData icon = Icons.delete_outline,
    Color iconColor = AppColors.danger,
    String cancelText = 'Cancel',
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 36),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isDark ? Colors.white : AppColors.text,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.white70 : AppColors.mutedText,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? AppColors.darkBorder : AppColors.border,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.of(dialogCtx, rootNavigator: true).pop(),
                    child: Text(
                      cancelText,
                      style: TextStyle(
                        color: isDark ? Colors.white70 : AppColors.text,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: iconColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogCtx, rootNavigator: true).pop();
                      onConfirm();
                    },
                    child: Text(
                      confirmText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ২. কাস্টম প্রফেশনাল About App ডায়ালগ
  static void showAppAboutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.contacts_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              AppLegalInfo.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: isDark ? Colors.white : AppColors.text,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'v${AppLegalInfo.appVersion}',
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white54 : AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLegalInfo.appDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isDark ? Colors.white70 : AppColors.text,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(dialogCtx, rootNavigator: true).pop();
                  context.push(AppRoutes.licenses);
                },
                child: const Text(
                  'View Licenses & Legal',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}