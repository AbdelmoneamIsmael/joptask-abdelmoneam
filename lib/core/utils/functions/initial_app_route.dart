import 'package:tasky_abdelmoneam/core/constant/app_constant.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/utils/cache/cache_helper.dart';

Future<void> initApp() async {
  await CacheHelper.init();
  String accessToken =
      await CacheHelper.getSecuerString(key: CachedKeys.accessToken);
  isAuth = accessToken.isNotEmpty;
}
