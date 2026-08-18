import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../core/widgets/custom_dialog.dart';
import '../../viewmodels/theme_viewmodel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = ThemeViewModel.instance;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDark ? AppColors.darkSurface : AppColors.surface;
    final titleTextColor = isDark ? Colors.white : AppColors.text;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? AppColors.darkAppbar : AppColors.appbar,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: themeVM,
          builder: (context, _) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                // Theme Settings Card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: isDark ? 0.25 : 0.03,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: cardBgColor,
                    borderRadius: BorderRadius.circular(14),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              themeVM.isDarkMode
                                  ? Icons.dark_mode_outlined
                                  : Icons.light_mode_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                          title: Text(
                            'Theme',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: titleTextColor,
                            ),
                          ),
                          subtitle: Text(
                            themeVM.isDarkMode ? 'Dark Mode' : 'Light Mode',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.white54
                                  : AppColors.mutedText,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.border,
                        ),
                        SwitchListTile(
                          title: Text(
                            'Change Theme',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: titleTextColor,
                            ),
                          ),
                          subtitle: Text(
                            themeVM.isDarkMode
                                ? 'Dark Mode active'
                                : 'Light Mode active',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.white54
                                  : AppColors.mutedText,
                              fontSize: 13,
                            ),
                          ),
                          secondary: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.palette_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                          value: themeVM.isDarkMode,
                          activeThumbColor: AppColors.primary,
                          onChanged: (val) => themeVM.toggleTheme(val),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // App Information Card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: isDark ? 0.25 : 0.03,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: cardBgColor,
                    borderRadius: BorderRadius.circular(14),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.info_outline,
                              color: AppColors.primary,
                            ),
                          ),
                          title: Text(
                            'About App',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: titleTextColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          // এখানে CustomDialog কল করা হয়েছে
                          onTap: () => CustomDialog.showAppAboutDialog(context),
                        ),
                        Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.border,
                        ),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.access_time_rounded,
                              color: AppColors.primary,
                            ),
                          ),
                          title: Text(
                            'Version',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: titleTextColor,
                            ),
                          ),
                          trailing: Text(
                            '1.0.0',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark
                                  ? Colors.white54
                                  : AppColors.mutedText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
