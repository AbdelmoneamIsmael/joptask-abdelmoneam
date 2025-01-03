import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/configuration/app_colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const CircularProgressIndicator(
        color: AppColors.backgroundColor,
        strokeWidth: 1,
      ),
    );
  }
}
