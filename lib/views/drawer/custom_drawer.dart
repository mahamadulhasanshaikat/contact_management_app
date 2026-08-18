import 'package:flutter/material.dart';
import 'package:contact_management_app/app/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/app_routes.dart';
import '../../core/widgets/custom_dialog.dart';

class ModernDrawer extends StatefulWidget {
  const ModernDrawer({super.key});

  @override
  State<ModernDrawer> createState() => _ModernDrawerState();
}

class _ModernDrawerState extends State<ModernDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.15, 0),
      end: Offset.zero,
    ).animate(curvedAnimation);

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.78,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SafeArea(
        top: false,
        bottom: false,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : AppColors.appbar,
          ),
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Items
              Expanded(child: _buildMenuContainer(isDark)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 235,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 20, 24),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.groups_2_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'My Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Manage your contacts easily',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.82),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuContainer(bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF181818) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 20),
        children: [
          _buildAnimatedItem(
            child: _buildDrawerItem(
              icon: Icons.group_outlined,
              title: 'All Contacts',
              isSelected: true,
              isDark: isDark,
              onTap: () => Navigator.pop(context),
            ),
          ),

          _buildAnimatedItem(
            child: _buildDrawerItem(
              icon: Icons.star_border_rounded,
              title: 'Favourites',
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.favorites);
              },
            ),
          ),

          _buildAnimatedItem(
            child: _buildDrawerItem(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: isDark ? Colors.white12 : const Color(0xFFE5E5EA),
            ),
          ),

          _buildAnimatedItem(
            child: _buildDrawerItem(
              icon: Icons.help_outline_rounded,
              title: 'About App',
              isDark: isDark,
              onTap: () {
                // ড্রয়ারটি বন্ধ করা
                Navigator.of(context).pop();

                // ড্রয়ার বন্ধের অ্যানিমেশন শেষ হওয়া পর্যন্ত অপেক্ষা করে ডায়েলগ ওপেন করা
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // রুট নেভিগেটরের কনটেক্সট ব্যবহার করে ডায়েলগ খোলা
                  final rootContext = Navigator.of(
                    context,
                    rootNavigator: true,
                  ).context;
                  CustomDialog.showAppAboutDialog(rootContext);
                });
              },
            ),
          ),

          _buildAnimatedItem(
            child: _buildDrawerItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                context.push(AppRoutes.settings);
              },
            ),
          ),

          _buildAnimatedItem(
            child: _buildDrawerItem(
              icon: Icons.logout_rounded,
              title: 'Logout',
              iconColor: const Color(0xFFF84D46),
              textColor: const Color(0xFFF84D46),
              isDark: isDark,
              onTap: () {
                Navigator.pop(context);
                // Handle logout
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedItem({required Widget child}) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: child),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
    bool isSelected = false,
    Color? iconColor,
    Color? textColor,
  }) {
    final Color effectiveIconColor = iconColor ?? AppColors.primary;
    final Color effectiveTextColor =
        textColor ?? (isDark ? Colors.white : const Color(0xFF252525));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: isSelected
            ? AppColors.primary.withValues(alpha: isDark ? 0.18 : 0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Row(
              children: [
                _buildIconContainer(
                  icon: icon,
                  color: effectiveIconColor,
                  isSelected: isSelected,
                  isDark: isDark,
                ),
                const SizedBox(width: 14),
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

  Widget _buildIconContainer({
    required IconData icon,
    required Color color,
    required bool isSelected,
    required bool isDark,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(
          alpha: isSelected ? (isDark ? 0.25 : 0.14) : (isDark ? 0.15 : 0.08),
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon, color: color, size: 21),
    );
  }
}
