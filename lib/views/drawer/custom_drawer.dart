import 'package:flutter/material.dart';
import 'package:contact_management_app/app/theme/app_colors.dart';
import 'widgets/header.dart';
import 'widgets/menu_container.dart';

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
      begin: Offset(-0.15, 0),
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
            color: isDark ? Color(0xFF1E1E1E) : AppColors.appbar,
          ),
          child: Column(
            children: [
              HeaderWidget(fadeAnimation: _fadeAnimation),
              Expanded(
                child: DrawerMenuContainer(
                  isDark: isDark,
                  slideAnimation: _slideAnimation,
                  fadeAnimation: _fadeAnimation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
