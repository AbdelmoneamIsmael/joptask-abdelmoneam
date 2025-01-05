import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/configuration/text_extention.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';

class HeaderSection extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeCubit>(context);
        return Container(
          color: AppColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22).w,
                child: Text(
                  'My Tasks',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xff24252C).withValues(alpha: .6),
                    height: 1,
                  ),
                ),
              ),
              16.verticalSpace,
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22).w,
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.w,
                  children: List.generate(
                    cubit.filters.length,
                    (index) => GestureDetector(
                      onTap: () => cubit.changeFilter(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: cubit.selectedFilter == index
                              ? AppColors.primary
                              : AppColors.unSelectedColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          cubit.filters[index].capitalize,
                          style: cubit.selectedFilter == index
                              ? AppTextStyle.bold.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.backgroundColor,
                                  height: 1.25)
                              : AppTextStyle.regular.copyWith(
                                  fontSize: 16.sp,
                                  color: const Color(0xff7C7C80),
                                  height: 1.25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 118.h;

  @override
  double get minExtent => 118.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
