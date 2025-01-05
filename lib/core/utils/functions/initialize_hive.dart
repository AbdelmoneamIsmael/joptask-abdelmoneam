import 'package:hive_flutter/adapters.dart';

import 'package:tasky_abdelmoneam/core/models/login_response.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoginResponseAdapter());

  
}
