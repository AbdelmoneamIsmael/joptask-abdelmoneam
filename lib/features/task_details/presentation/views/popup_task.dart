import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';

class PopUpTask extends StatelessWidget {
  const PopUpTask({
    super.key,
    this.onEditTap,
    this.onDeleteTap,
  });
  final void Function()? onEditTap, onDeleteTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        direction: PopoverDirection.bottom,
        bodyBuilder: (context) {
          return UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: onEditTap,
                    padding: EdgeInsets.symmetric(vertical: 12.5.h),
                    minSize: 0,
                    child: Text(
                      'Edit',
                      style: AppTextStyle.meduim.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      width: .5,
                      color: AppColors.captionAlphaColor,
                    ))),
                    child: CupertinoButton(
                      onPressed: onDeleteTap,
                      minSize: 0,
                      padding: EdgeInsets.symmetric(vertical: 12.5.h),
                      child: Text(
                        'Delete',
                        style: AppTextStyle.meduim.copyWith(
                            color: AppColors.orangeColor, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      child: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
}
