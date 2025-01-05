import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_text_style.dart';
import 'package:tasky_abdelmoneam/core/configuration/text_extention.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/initialize_getit.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/presentation/widgets/profile_widgets.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/cubit/profile_cubit.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/cubit/profile_state.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/repo/get_profile_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 22).w,
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset(
              AppIcons.backArrow,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        leadingWidth: (22 + 24).w,
        title: const Text('Profile'),
        titleSpacing: 8.w,
        titleTextStyle: AppTextStyle.bold.copyWith(
          fontSize: 16.sp,
        ),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt.get<GetProfileData>(),
        )..onInit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 24.h, left: 24.5.w, right: 24.5.w),
                child: state is ProfileLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is ProfileLoadedSuccess
                        ? Column(
                            spacing: 8.h,
                            children: [
                              ProfileWidget(
                                name: 'NAME',
                                value: state.userModel.displayName ??
                                    "Abdelmoenam",
                              ),
                              ProfileWidget(
                                suffix: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                          text: state.userModel.username ??
                                              "+201021016072"),
                                    ).then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Copied to Clipboard!')),
                                      );
                                    });
                                  },
                                  child: SvgPicture.asset(AppIcons.copyIcon),
                                ),
                                name: 'PHONE',
                                value: BlocProvider.of<ProfileCubit>(context)
                                    .formatPhoneNumber(
                                        state.userModel.username ??
                                            "+2001021016072"),
                              ),
                              ProfileWidget(
                                name: 'LEVEL',
                                value: state.userModel.level.name.capitalize,
                              ),
                              ProfileWidget(
                                name: 'YEAR OF EXPERIENCE',
                                value:
                                    " ${state.userModel.experienceYears} years",
                              ),
                              ProfileWidget(
                                name: 'LOCATION',
                                value: state.userModel.address ?? "Cairo",
                              ),
                            ],
                          )
                        : const Center(
                            child: Text('No Data Try Contact Admin'),
                          ),
              ),
            );
          },
        ),
      ),
    );
  }

  // String formatPhoneNumber(String phoneNumber) {

  //   TextEditingValue newValue = TextEditingValue(text: phoneNumber);
  //   MaskedInputFormatter('+(000) 000-000-0000');
  //   // Format the number (for example, in the format +1 (234) 567-8900)
  //    PhoneInputFormatter().formatEditUpdate(newValue, newValue);
  // }
}
