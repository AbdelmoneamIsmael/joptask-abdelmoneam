import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';

Future<DateTime?> showDate(
  BuildContext context,
) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022, 6),
    lastDate: DateTime(2101),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            onSurface: AppColors.normalTextColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}
