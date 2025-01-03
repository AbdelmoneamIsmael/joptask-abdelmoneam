import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/constant/enums.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_dropdown.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';
import 'package:tasky_abdelmoneam/core/widgets/country_code_picker.dart';
import 'package:tasky_abdelmoneam/core/widgets/login_button.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/cubit/register_cubit_cubit.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/cubit/register_cubit_state.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/repo/register_repo.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        registerRepo: getIt.get<RegisterRepo>(),
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SuccessRegister) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Register Success"),
              ),
            );
            context.pushNamedAndRemoveUntil(Routes.home,
                predicate: (_) => false);
          } else if (state is FailedRegister) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: AppColors.errorTextColor,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<RegisterCubit>(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.5).w,
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  24.verticalSpace,
                  Column(
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        controller: cubit.nameController,
                        hint: "Name...",
                      ),
                      AppTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.phone,
                        controller: cubit.phoneController,
                        hint: "Phone Number...",
                        prefixIcon: CountryCodeIcon(
                          onChanged: (code) {
                            print(code.dialCode);
                            cubit.countryCode = code.dialCode!;
                          },
                        ),
                      ),
                      AppTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        controller: cubit.yearsExperienceController,
                        hint: "Years of Experience...",
                      ),
                      AppDropdown(
                        hint: "Choose experience Level...",
                        onChanged: (value) {
                          PersonLevel level = value!;
                          cubit.experienceLevelController.text = level.name;
                        },
                        items: PersonLevel.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                      ),
                      AppTextField(
                        controller: cubit.addressController,
                        hint: "Address...",
                      ),
                      AppTextField(
                        isPassword: cubit.passwordOffVisible,
                        controller: cubit.passwordController,
                        hint: "Password...",
                        suffixIcon: GestureDetector(
                          onTap: cubit.changePasswordVisibility,
                          child: cubit.passwordOffVisible
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  state is LoadingRegister
                      ? const LoadingButton()
                      : ElevatedButton(
                          onPressed: cubit.register,
                          child: const Text("Sign Up"),
                        ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have any account? ",
                        style: AppTextStyle.regular.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.captionTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.pushNamed(Routes.loginScreen),
                        child: Text(
                          "Sign in",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
