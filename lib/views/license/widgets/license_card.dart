import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/constants/app_legal_info.dart';

class LicenseBrandingCard extends StatelessWidget {
  final bool isDark;

  const LicenseBrandingCard({super.key, required this.isDark});

  void _copyEmail(BuildContext context) {
    Clipboard.setData(ClipboardData(text: AppLegalInfo.supportEmail));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Support email copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.03),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.contacts_rounded, color: Colors.white, size: 38),
          ),
          SizedBox(height: 16),
          Text(
            AppLegalInfo.appName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.text,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Version ${AppLegalInfo.appVersion}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white54 : AppColors.mutedText,
            ),
          ),
          SizedBox(height: 12),
          Text(
            AppLegalInfo.appDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: isDark ? Colors.white70 : AppColors.text,
            ),
          ),
          SizedBox(height: 14),
          InkWell(
            onTap: () => _copyEmail(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: isDark ? 0.18 : 0.08,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 15,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 6),
                  Text(
                    AppLegalInfo.supportEmail,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.copy_rounded, size: 13, color: AppColors.primary),
                ],
              ),
            ),
          ),
          SizedBox(height: 14),
          Text.rich(
            TextSpan(
              text: '© ${AppLegalInfo.copyrightYear} ',
              style: TextStyle(
                fontSize: 11.5,
                height: 1.4,
                color: isDark ? Colors.white38 : AppColors.mutedText,
              ),
              children: [
                TextSpan(
                  text: AppLegalInfo.developerName,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: '. All Rights Reserved.'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
