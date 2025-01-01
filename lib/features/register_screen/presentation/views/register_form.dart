import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';
import 'package:tasky_abdelmoneam/core/widgets/country_code_picker.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.5).w,
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
              const AppTextField(
                hint: "Name...",
              ),
              const AppTextField(
                hint: "Phone Number...",
                prefixIcon: CountryCodeIcon(),
              ),
              const AppTextField(
                hint: "Years of Experience...",
              ),
              const AppTextField(
                hint: "Experience Level...",
              ),
              const AppTextField(
                hint: "Address...",
              ),
              const AppTextField(
                hint: "Password...",
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                ),
              ),
            ],
          ),
          24.verticalSpace,
          ElevatedButton(
            onPressed: () {},
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
    );
  }
}
