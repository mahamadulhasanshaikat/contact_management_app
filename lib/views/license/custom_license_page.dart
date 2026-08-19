import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../core/constants/app_legal_info.dart';
import 'widgets/license_card.dart';
import 'widgets/license_section_header.dart';
import 'widgets/main_license_card.dart';
import 'widgets/library_license_tile.dart';

class CustomLicensePage extends StatelessWidget {
  const CustomLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Licenses & Legal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? AppColors.darkAppbar : AppColors.appbar,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            // Branding Card
            LicenseBrandingCard(isDark: isDark),

            SizedBox(height: 24),

            // Application License
            LicenseSectionHeader(title: 'APPLICATION LICENSE', isDark: isDark),
            SizedBox(height: 10),
            MainLicenseCard(isDark: isDark),

            SizedBox(height: 24),

            // Third-Party Dependencies
            LicenseSectionHeader(
              title: 'THIRD-PARTY OPEN SOURCE LIBRARIES',
              isDark: isDark,
            ),
            SizedBox(height: 10),
            ...AppLegalInfo.thirdPartyLibraries.map(
              (lib) => LibraryLicenseTile(lib: lib, isDark: isDark),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
