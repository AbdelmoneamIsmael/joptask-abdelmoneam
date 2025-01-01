import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';
import 'package:tasky_abdelmoneam/core/widgets/app_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  AppImages.registerBoard,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 32.h,
              left: 0,
              right: 0,
              child: const RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}

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
