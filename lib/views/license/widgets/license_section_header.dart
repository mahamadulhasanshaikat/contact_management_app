import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class LicenseSectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;

  const LicenseSectionHeader({
    super.key,
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: isDark ? Colors.white54 : AppColors.mutedText,
        ),
      ),
    );
  }
}
