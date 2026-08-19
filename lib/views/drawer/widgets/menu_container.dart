import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:contact_management_app/app/routes/app_routes.dart';
import 'package:contact_management_app/app/theme/app_colors.dart';
import 'package:contact_management_app/core/widgets/custom_dialog.dart';
import 'animated_item.dart';
import 'item_tile.dart';

class DrawerMenuContainer extends StatelessWidget {
  final bool isDark;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const DrawerMenuContainer({
    super.key,
    required this.isDark,
    required this.slideAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 18, 10, 20),
        children: [
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.group_outlined,
              title: 'All Contacts',
              isSelected: true,
              isDark: isDark,
              onTap: () => Navigator.pop(context),
            ),
          ),
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.star_border_rounded,
              title: 'Favourites',
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.favorites);
              },
            ),
          ),
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.person_add_alt_1_outlined,
              title: 'Add Contact',
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.addContact);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: isDark ? AppColors.darkBorder : AppColors.border,
            ),
          ),
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.help_outline_rounded,
              title: 'About App',
              isDark: isDark,
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final rootContext = Navigator.of(
                    context,
                    rootNavigator: true,
                  ).context;
                  CustomDialog.showAppAboutDialog(rootContext);
                });
              },
            ),
          ),
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.settings);
              },
            ),
          ),
          _wrapAnimation(
            DrawerItemTile(
              icon: Icons.logout_rounded,
              title: 'Logout',
              iconColor: AppColors.danger,
              textColor: AppColors.danger,
              isDark: isDark,
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final rootContext = Navigator.of(
                    context,
                    rootNavigator: true,
                  ).context;
                  CustomDialog.showConfirmationDialog(
                    context: rootContext,
                    title: 'Logout',
                    message:
                        'Are you sure you want to logout from this account?',
                    confirmText: 'Logout',
                    icon: Icons.logout_rounded,
                    iconColor: AppColors.danger,
                    onConfirm: () {
                      // Handle logout
                    },
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _wrapAnimation(Widget child) {
    return DrawerAnimatedItem(
      slideAnimation: slideAnimation,
      fadeAnimation: fadeAnimation,
      child: child,
    );
  }
}
