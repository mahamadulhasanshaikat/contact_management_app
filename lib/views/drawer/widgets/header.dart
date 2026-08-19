import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final String title;
  final String subtitle;
  final IconData icon;

  const HeaderWidget({
    super.key,
    required this.fadeAnimation,
    this.title = 'My Contacts',
    this.subtitle = 'Manage your contacts easily',
    this.icon = Icons.groups_2_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 20, 24),
        child: FadeTransition(
          opacity: fadeAnimation,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(icon, color: Colors.white, size: 50),
                ),
                SizedBox(height: 18),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
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
}
