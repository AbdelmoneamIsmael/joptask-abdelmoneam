import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'onCreate -- ${bloc.runtimeType}'.printConsole;
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'onChange -- ${bloc.runtimeType}, $change'.printConsole;
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
   'onError -- ${bloc.runtimeType}, $error'.printConsole;
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
   'onClose -- ${bloc.runtimeType}'.printConsole;
  }
}

extension PrintHelper on String {
  void get printConsole => log(this);
}
