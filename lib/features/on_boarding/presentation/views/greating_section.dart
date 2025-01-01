import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';

class GreatingSection extends StatelessWidget {
  const GreatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(
          AppImages.onboarding,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}