import 'package:flutter/material.dart';
import 'package:multi_step_form/provider/planProvider.dart';
import 'package:multi_step_form/view/signupCheck.dart';
import 'package:multi_step_form/view/signupStepOne.dart';
import 'package:multi_step_form/view/signupStepTwo.dart';
import 'package:multi_step_form/view/signupStepThree.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PlanProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Formulário",
        theme: ThemeData(fontFamily: 'Ubuntu'),
        routes: {
          '/': (context) => const SignupStepOne(),
          '/second-step': (context) => const StepTwo(),
          '/third-step': (context) => const StepThree(),
          '/final-step': (context) => const FinalStep()
        },
      ),
    );
  }
}
