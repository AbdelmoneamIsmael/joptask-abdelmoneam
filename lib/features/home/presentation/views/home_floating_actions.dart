import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_cubit.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';

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
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is GEttingSearchSuccess) {
                GoRouter.of(context).push(
                  Routes.taskDetailsScreen,
                  extra: {
                    'task': state.task,
                    "cubit": context.read<HomeCubit>(),
                  },
                );
              } else if (state is GEttingSearchFail) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.errorTextColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  var result = await Permission.camera.request();
                  if (result.isGranted) {
                    String res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ),
                    );
                    if (res.isNotEmpty) {
                      BlocProvider.of<HomeCubit>(context).search(res);
                    }
                  }
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryContainerColor,
                  ),
                  child: SvgPicture.asset(AppIcons.scanIcon),
                ),
              );
            },
          ),
          14.verticalSpace,
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              GoRouter.of(context).push(Routes.createTask).then(
                    (value) => BlocProvider.of<HomeCubit>(context).refresh(),
                  );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
