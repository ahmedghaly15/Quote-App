import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/reusable_components.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setSystemUIOverlayStyle();

  runApp(const QuotifyApp());
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    CustomHelper.setTheSystemUIOverlayStyle(),
  );
}
