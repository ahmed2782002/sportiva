import 'package:flutter/material.dart';

import '../widgets/owner_account_item.dart';

class OwnerAccountScreen extends StatelessWidget {
  const OwnerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F7F8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'حسابي',
          style: TextStyle(
            color: Color(0xFF252525),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              // صورة الـ Owner
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF5A163F),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 14),

              // اسم الـ Owner
              const Text(
                'Ahmed Mohamed',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),

              const SizedBox(height: 5),

              // نوع الحساب
              const Text(
                'Venue Owner',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF777777),
                ),
              ),

              const SizedBox(height: 30),

              // عناصر الحساب
              OwnerAccountItem(
                icon: Icons.stadium_outlined,
                title: 'ملاعبـي',
                onTap: () {},
              ),

              OwnerAccountItem(
                icon: Icons.calendar_month_outlined,
                title: 'الحجوزات',
                onTap: () {},
              ),

              OwnerAccountItem(
                icon: Icons.edit_outlined,
                title: 'تعديل الحساب',
                onTap: () {},
              ),

              OwnerAccountItem(
                icon: Icons.settings_outlined,
                title: 'الإعدادات',
                onTap: () {},
              ),

              const SizedBox(height: 10),

              // تسجيل الخروج
              OwnerAccountItem(
                icon: Icons.logout,
                title: 'تسجيل الخروج',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}