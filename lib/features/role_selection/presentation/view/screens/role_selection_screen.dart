import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/nav.dart';
import '../../../../../core/widgets/Button/master_button.dart';
import '../../../../onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../../data/model/account_role.dart';
import '../../view_model/role_selection_cubit.dart';
import '../../view_model/role_selection_state.dart';
import '../widgets/role_card.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => RoleSelectionCubit(),
    child: BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
      builder: (context, state) {
        final cubit = context.read<RoleSelectionCubit>();
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 30.h, 24.w, 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SPORTIVA',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.6,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Text(
                    AppString.chooseAccountType.tr(),
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppString.chooseAccountTypeSubtitle.tr(),
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 15.sp,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ...AccountRole.values.map(
                    (role) => Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: RoleCard(
                        role: role,
                        selected: state.selectedRole == role,
                        onTap: () => cubit.selectRole(role),
                      ),
                    ),
                  ),
                  const Spacer(),
                  MasterButton(
                    typeButton: TypeButton.textOnly,
                    text:
                        '${AppString.continueAs.tr()} ${state.selectedRole.title}',
                    onPressed: () async {
                      await cubit.saveSelectedRole();
                      navigateTo(const OnboardingScreen());
                    },
                    height: 56.h,
                    borderRadius: 18.r,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
