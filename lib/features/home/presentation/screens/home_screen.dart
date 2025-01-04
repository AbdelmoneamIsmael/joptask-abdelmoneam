import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/routes/context_extention.dart';
import 'package:tasky_abdelmoneam/core/routes/routes.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_icons.dart';

import 'package:tasky_abdelmoneam/features/home/presentation/views/home_body.dart';
import 'package:tasky_abdelmoneam/features/home/presentation/views/home_floating_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
    LoginResponse? loginResponse = box.getAt(0);
    loginResponse.toString().printConsole;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
        actions: [
          GestureDetector(
              onTap: () {
                context.pushNamed(Routes.profileScreen);
              },
              child: SvgPicture.asset(AppIcons.profileIcon)),
          20.horizontalSpace,
          SvgPicture.asset(AppIcons.logoutIcon),
          22.horizontalSpace,
        ],
      ),
      body: const Stack(
        children: [
          HomeBody(),
          HomeFloatingActions(),
        ],
      ),
    );
  }
}
