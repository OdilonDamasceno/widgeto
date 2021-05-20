import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ViewWindow extends FlutterView {
  final ViewConfiguration configuration;

  ViewWindow({@required this.configuration});
  @override
  PlatformDispatcher get platformDispatcher => PlatformDispatcher.instance;

  @override
  ViewConfiguration get viewConfiguration => configuration;
}
