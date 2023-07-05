import 'package:desktop_app/ui/calculator_screen.dart';
import 'package:desktop_app/utils/window_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:ui' as ui;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.setSize(Size(
    WindowSizeEnum.desktop.width,
    WindowSizeEnum.desktop.height,
  ));

  runApp(
    ProviderScope(child: CalculatorApp()),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    ); // MaterialApp
  }
}
