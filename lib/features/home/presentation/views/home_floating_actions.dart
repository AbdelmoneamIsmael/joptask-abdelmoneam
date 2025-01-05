import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/routes/app_routers.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

class HomeFloatingActions extends StatelessWidget {
  const HomeFloatingActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32.h,
      right: 24.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => PageRoutes.router.go(Routes.profileScreen),
            child: Container(
              height: 50.h,
              width: 50.w,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryContainerColor,
              ),
              child: SvgPicture.asset(AppIcons.scanIcon),
            ),
          ),
          14.verticalSpace,
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              GoRouter.of(context).push(Routes.createTask);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
