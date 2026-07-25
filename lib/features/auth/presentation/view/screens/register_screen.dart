import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/nav.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/Button/master_button.dart';
import '../../../../home/presentation/view/screens/home_screen.dart';
import '../../../../role_selection/data/model/account_role.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_state.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/auth_layout.dart';
import '../widgets/auth_switch.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.role});

  final AccountRole role;

  String get _extraLabel => role == AccountRole.venueOwner
      ? AppString.venueName.tr()
      : role == AccountRole.coach
      ? AppString.sportSpecialty.tr()
      : AppString.userName.tr();

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => RegisterCubit(),
    child: BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return AuthLayout(
          title: AppString.createAccount.tr(),
          subtitle: '${AppString.registerSubtitle.tr()} ${role.title}',
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthInputField(
                  label: AppString.name.tr(),
                  controller: cubit.nameController,
                  icon: Icons.person_outline_rounded,
                  validator: (value) =>
                      Validators.validateRequired(value, AppString.name.tr()),
                ),
                SizedBox(height: 16.h),
                AuthInputField(
                  label: AppString.email.tr(),
                  controller: cubit.emailController,
                  icon: Icons.mail_outline_rounded,
                  textInputType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 16.h),
                AuthInputField(
                  label: AppString.mobileNumber.tr(),
                  controller: cubit.phoneController,
                  icon: Icons.phone_outlined,
                  textInputType: TextInputType.phone,
                  validator: (value) => Validators.validateRequired(
                    value,
                    AppString.mobileNumber.tr(),
                  ),
                ),
                SizedBox(height: 16.h),
                AuthInputField(
                  label: _extraLabel,
                  controller: cubit.extraController,
                  icon: role == AccountRole.venueOwner
                      ? Icons.storefront_outlined
                      : Icons.sports_outlined,
                  validator: (value) =>
                      Validators.validateRequired(value, _extraLabel),
                ),
                SizedBox(height: 16.h),
                AuthInputField(
                  label: AppString.password.tr(),
                  controller: cubit.passwordController,
                  icon: Icons.lock_outline_rounded,
                  obscureText: state.isPasswordObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.isPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: cubit.togglePasswordVisibility,
                  ),
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 16.h),
                AuthInputField(
                  label: AppString.confirmPassword.tr(),
                  controller: cubit.confirmPasswordController,
                  icon: Icons.lock_reset_outlined,
                  obscureText: state.isPasswordObscured,
                  validator: (value) => Validators.validateConfirmPassword(
                    value,
                    cubit.passwordController.text,
                  ),
                ),
                SizedBox(height: 24.h),
                MasterButton(
                  typeButton: TypeButton.textOnly,
                  text: AppString.createAccount.tr(),
                  onPressed: () {
                    if (cubit.validate()) {
                      navigateFinish(HomeScreen(role: role));
                    }
                  },
                  height: 56.h,
                  borderRadius: 18.r,
                ),
                SizedBox(height: 16.h),
                AuthSwitch(
                  text: AppString.alreadyHaveAccount.tr(),
                  action: AppString.signIn.tr(),
                  onTap: navigateBack,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
