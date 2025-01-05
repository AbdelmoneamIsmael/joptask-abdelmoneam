import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';
import 'package:tasky_abdelmoneam/core/widgets/country_code_picker.dart';
import 'package:tasky_abdelmoneam/core/widgets/login_button.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/cubit/login_cubit.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/cubit/login_state.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/login_repo/login_repo.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.5).w,
      child: BlocProvider(
        create: (context) => LoginCubit(
          loginRepo: getIt.get<LoginRepo>(),
        ),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
             PageRoutes.clearAndNavigate(
                Routes.home,
                
              );
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.errorTextColor,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<LoginCubit>(context);
            return Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  24.verticalSpace,
                  AppTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    controller: cubit.phoneController,
                    prefixIcon: CountryCodeIcon(
                      onChanged: (value) {
                        cubit.countryCode = value.dialCode!;
                      },
                    ),
                    hint: "Phone number..",
                  ),
                  20.verticalSpace,
                  AppTextField(
                    hint: "Password...",
                    isPassword: cubit.securePassword,
                    controller: cubit.passwordController,
                    suffixIcon: GestureDetector(
                      onTap: cubit.changePasswordVisibility,
                      child: cubit.securePassword
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                            )
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  24.verticalSpace,
                  state is LoginLoading
                      ? const LoadingButton()
                      : ElevatedButton(
                          onPressed: cubit.login,
                          child: const Text("Sign In"),
                        ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t have any account? ",
                        style: AppTextStyle.regular.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.captionTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).push(Routes.registerScreen),
                        child: Text(
                          "Sign Up here",
                          style: AppTextStyle.bold.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
