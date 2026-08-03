import 'package:flutter/material.dart';
import '../widgets/coach_account_item.dart';

class CoachAccountScreen extends StatelessWidget {
  const CoachAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFF6B075C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // Profile Image
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFF4D9EE),
                          width: 4,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Color(0xFF6B075C),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Coach Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Professional Coach',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Account Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'حسابي',
                    style: TextStyle(
                      color: Color(0xFF2D1B2E),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Edit Profile
              CoachAccountItem(
                icon: Icons.person_outline,
                title: 'تعديل الملف الشخصي',
                subtitle: 'تعديل بياناتك الشخصية',
                onTap: () {},
              ),

              // My Sessions
              CoachAccountItem(
                icon: Icons.sports,
                title: 'جلساتي التدريبية',
                subtitle: 'إدارة الجلسات التدريبية الخاصة بك',
                onTap: () {},
              ),

              // My Bookings
              CoachAccountItem(
                icon: Icons.calendar_month_outlined,
                title: 'الحجوزات',
                subtitle: 'عرض وإدارة الحجوزات',
                onTap: () {},
              ),

              // Reviews
              CoachAccountItem(
                icon: Icons.star_outline,
                title: 'التقييمات',
                subtitle: 'مشاهدة تقييمات العملاء',
                onTap: () {},
              ),

              // Settings
              CoachAccountItem(
                icon: Icons.settings_outlined,
                title: 'الإعدادات',
                subtitle: 'إعدادات الحساب والتطبيق',
                onTap: () {},
              ),

              // Logout
              CoachAccountItem(
                icon: Icons.logout,
                title: 'تسجيل الخروج',
                subtitle: 'الخروج من حسابك',
                iconColor: const Color(0xFFB00020),
                onTap: () {},
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}