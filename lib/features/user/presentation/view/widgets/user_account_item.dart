import 'package:flutter/material.dart';

class UserAccountItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconBackgroundColor;
  final Widget? trailing;

  const UserAccountItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconBackgroundColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF4A1D3F);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: primaryColor.withOpacity(0.08),
          highlightColor: primaryColor.withOpacity(0.04),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: primaryColor.withOpacity(0.08),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: (iconBackgroundColor ?? primaryColor).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: iconBackgroundColor ?? primaryColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
                trailing ??
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 14,
                      color: primaryColor.withOpacity(0.4),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}