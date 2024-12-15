import 'package:bloc/bloc.dart';
import 'package:block_fake_login/src/app.dart';
import 'package:block_fake_login/src/utils/simple_bloc.observer.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
