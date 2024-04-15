import 'package:flutter/material.dart';
import 'package:multi_step_form/view/signupstepOne.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formulário",
      theme: ThemeData(fontFamily: 'Ubuntu'),
      routes: {
        '/': (context) => const StepOne(),
      },
    );
  }
}
