import 'package:demo_application/app.dart';
import 'package:demo_application/injector.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MyAppp());
}
