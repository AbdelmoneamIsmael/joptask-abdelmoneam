import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';
 
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.normalTextColor.withAlpha(65),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
