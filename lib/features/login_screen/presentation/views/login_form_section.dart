import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.5).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          24.verticalSpace,
          const AppTextField(
            hint: "Phone number..",
          ),
          20.verticalSpace,
          const AppTextField(
            hint: "Password..",
            suffixIcon: Icon(
              Icons.remove_red_eye_outlined,
            ),
          ),
          24.verticalSpace,
          ElevatedButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.home,
                predicate: (_) => false,
              );
            },
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
                onTap: () => context.pushNamed(Routes.registerScreen),
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
  }
}
