import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/nav.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/Button/master_button.dart';
import '../../../../home/presentation/view/screens/home_screen.dart';
import '../../view_model/login_cubit.dart';
import '../../view_model/login_state.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/auth_layout.dart';
import '../widgets/auth_switch.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => LoginCubit(),
    child: BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      final cubit = context.read<LoginCubit>();
      return AuthLayout(
        title: AppString.welcomeBack.tr(),
        subtitle: AppString.loginSubtitle.tr(),
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthInputField(label: AppString.email.tr(), controller: cubit.emailController, icon: Icons.mail_outline_rounded, textInputType: TextInputType.emailAddress, validator: Validators.validateEmail),
              SizedBox(height: 18.h),
              AuthInputField(label: AppString.password.tr(), controller: cubit.passwordController, icon: Icons.lock_outline_rounded, obscureText: state.isPasswordObscured, suffixIcon: IconButton(icon: Icon(state.isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined), onPressed: cubit.togglePasswordVisibility), validator: Validators.validatePassword),
              Align(alignment: AlignmentDirectional.centerEnd, child: TextButton(onPressed: () {}, child: Text(AppString.forgotPassword.tr(), style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w700)))),
              SizedBox(height: 14.h),
              MasterButton(typeButton: TypeButton.textOnly, text: AppString.signIn.tr(), onPressed: () { if (cubit.validate()) navigateFinish(HomeScreen(role: cubit.role)); }, height: 56.h, borderRadius: 18.r),
              SizedBox(height: 18.h),
              AuthSwitch(text: AppString.noAccount.tr(), action: AppString.signUp.tr(), onTap: () => navigateTo(RegisterScreen(role: cubit.role))),
            ],
          ),
        ),
      );
    },
    ),
  );
}
