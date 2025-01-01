import 'package:flutter/material.dart';

import 'package:tasky_abdelmoneam/features/login_screen/presentation/views/login_form_section.dart';
import 'package:tasky_abdelmoneam/features/on_boarding/presentation/views/greating_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          GreatingSection(),
          LoginFormSection(),
        ],
      ),
    );
  }
}
