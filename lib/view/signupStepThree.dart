import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_step_form/view/signUpTemplate.dart';
import 'package:multi_step_form/provider/planProvider.dart';
import 'package:provider/provider.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SignupTemplate(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Confirmar compra",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFE07274e),
              ),
            ),
            const SizedBox(height: 18.0),
            const Text(
              "Verifique se as informações estão corretas antes de confirmar",
              style: TextStyle(fontSize: 16, color: Color(0xFF9d9da6)),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              decoration: BoxDecoration(
                  color: const Color(0xFFf8f9fe),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Ubuntu'),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Nome: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFE07274e)),
                        ),
                        TextSpan(
                          text: '${context.watch<PlanProvider>().data['name']}',
                        ),
                        const TextSpan(
                          text: '\n\nEmail: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFE07274e)),
                        ),
                        TextSpan(
                          text:
                              '${context.watch<PlanProvider>().data['email']}',
                        ),
                        const TextSpan(
                          text: '\n\nTelefone: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFE07274e)),
                        ),
                        TextSpan(
                          text:
                              '${context.watch<PlanProvider>().data['phone']}',
                        ),
                        const TextSpan(
                          text: '\n\nTipo de plano: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFE07274e)),
                        ),
                        TextSpan(
                          text: context.watch<PlanProvider>().planType,
                        ),
                        const TextSpan(
                          text: '\n\nPreço total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFE07274e)),
                        ),
                        TextSpan(
                          text: 'R\$ ${context.watch<PlanProvider>().planPrice}', style: const TextStyle(color: Color(0xFF473DFF))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
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
                    child: const Text("Anterior")),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/final-step');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFE07274e),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      textStyle: const TextStyle(fontSize: 14.0),
                    ),
                    child: const Text("Concluir")),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
//   onPressed: () {
//     Navigator.pop(context);
//   },
//   child: const Text("Voltar"),
//   style: ElevatedButton.styleFrom(
//     backgroundColor: const Color(0xFE07274e),
//     foregroundColor: const Color(0xFE07274e),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//   ),
// ),
