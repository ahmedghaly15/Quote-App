import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc_observer.dart';
import 'package:quotes_app/locator.dart';
import 'package:reusable_components/reusable_components.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setSystemUIOverlayStyle();

  Bloc.observer = MyBlocObserver();

  await setUpServiceLocator();

  runApp(const QuotifyApp());
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    CustomHelper.setTheSystemUIOverlayStyle(),
  );
}
