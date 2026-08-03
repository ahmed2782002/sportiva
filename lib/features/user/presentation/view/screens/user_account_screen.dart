import 'package:flutter/material.dart';
import '../widgets/user_account_item.dart';


class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4A1D3F);
    const backgroundColor = Color(0xFFF5F3F7);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with gradient
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4A1D3F),
                      Color(0xFF6B2D5C),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Title
                    const Text(
                      'حسابي',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Avatar with ring
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(0xFF6B2D5C),
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    const Text(
                      'Ahmed Mohamed',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Role badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // Stats Cards Row
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildStatCard(
                      icon: Icons.sports_soccer,
                      label: 'الملاعب',
                      value: '3',
                      color: primaryColor,
                    ),
                    const SizedBox(width: 12),
                    _buildStatCard(
                      icon: Icons.calendar_month,
                      label: 'الحجوزات',
                      value: '24',
                      color: const Color(0xFF6B2D5C),
                    ),
                    const SizedBox(width: 12),
                    _buildStatCard(
                      icon: Icons.star_rounded,
                      label: 'التقييم',
                      value: '4.8',
                      color: const Color(0xFF8B4A7A),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // Menu Items
            SliverList(
              delegate: SliverChildListDelegate([
                UserAccountItem(
                  icon: Icons.sports_soccer_outlined,
                  title: 'ملاعبي',
                  onTap: () {},
                ),
                UserAccountItem(
                  icon: Icons.calendar_today_outlined,
                  title: 'الحجوزات',
                  onTap: () {},
                ),
                UserAccountItem(
                  icon: Icons.edit_outlined,
                  title: 'تعديل الحساب',
                  onTap: () {},
                ),
                UserAccountItem(
                  icon: Icons.notifications_outlined,
                  title: 'الإشعارات',
                  onTap: () {},
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A1D3F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                UserAccountItem(
                  icon: Icons.settings_outlined,
                  title: 'الإعدادات',
                  onTap: () {},
                ),
                UserAccountItem(
                  icon: Icons.help_outline,
                  title: 'المساعدة والدعم',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                // Logout
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE74C3C).withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 44,
                              height: 44,
                              child: Icon(
                                Icons.logout_rounded,
                                color: Color(0xFFE74C3C),
                                size: 22,
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFE74C3C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ]),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.home_outlined,
                  label: 'الرئيسية',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: Icons.search_outlined,
                  label: 'البحث',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: Icons.calendar_month_outlined,
                  label: 'الحجوزات',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: Icons.person,
                  label: 'الملف الشخصي',
                  isActive: true,
                  activeColor: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF888888),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    Color? activeColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? (activeColor ?? const Color(0xFF4A1D3F)) : const Color(0xFFAAAAAA),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? (activeColor ?? const Color(0xFF4A1D3F)) : const Color(0xFFAAAAAA),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}