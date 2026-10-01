import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cp.dart';
import 'screens/mw.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChargerProvider())],
      child: const EVApp(),
    ),
  );
}

class EVApp extends StatelessWidget {
  const EVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV Share',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const MainWrapper(),
    );
  }
}
