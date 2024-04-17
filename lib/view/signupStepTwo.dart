import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_step_form/provider/planProvider.dart';
import 'package:provider/provider.dart';
import 'package:multi_step_form/view/signUpTemplate.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<bool> _selectedPlans = [true, false, false];
  List<Widget> plans = [
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          Icon(Icons.person_2, color: Color(0xFF473DFF)),
          SizedBox(width: 8),
          Text('Individual',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 32),
          Text('\$99.99'),
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          Icon(Icons.people_alt, color: Color(0xFF473DFF)),
          SizedBox(width: 8),
          Text('Equipe',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 52),
          Text('\$199.99'),
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          Icon(Icons.cases_rounded, color: Color(0xFF473DFF)),
          SizedBox(width: 8),
          Text('Empresa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 38),
          Text('\$299.99'),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SignupTemplate(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selecione seu plano",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFE07274e),
              ),
            ),
            const SizedBox(height: 15),
            ToggleButtons(
              direction: Axis.vertical,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedPlans.length; i++) {
                    _selectedPlans[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: const Color(0xFF473DFF),
              selectedColor: const Color(0xFE07274e),
              fillColor: const Color(0xFFf8f9fe),
              color: const Color(0xFE07274e),
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedPlans,
              children: plans,
            ),
            const SizedBox(height: 20),
            Row (
              children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFE07274e),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    textStyle: const TextStyle(fontSize: 14.0),
                ),
                child: const Text("Anterior")
              ),
              const Spacer(), 
              ElevatedButton(
                onPressed: () {
                  context.read<PlanProvider>().selectPlan(_selectedPlans.indexOf(true));
                  Navigator.pushNamed(context, '/third-step');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFE07274e),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    textStyle: const TextStyle(fontSize: 14.0),
                ),
                child: const Text("Próximo")
              ),
              ]
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
