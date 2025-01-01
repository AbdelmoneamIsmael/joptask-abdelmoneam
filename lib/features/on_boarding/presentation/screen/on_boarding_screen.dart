import 'package:flutter/material.dart';

import 'package:tasky_abdelmoneam/features/on_boarding/presentation/views/get_started_section.dart';
import 'package:tasky_abdelmoneam/features/on_boarding/presentation/views/greating_section.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          GreatingSection(),
          GetStartedSection(),
        ],
      ),
    );
  }
}



