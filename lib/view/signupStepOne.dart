import 'package:flutter/material.dart';
import 'package:multi_step_form/provider/planProvider.dart';
import 'package:multi_step_form/view/signUpTemplate.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupStepOne extends StatefulWidget {
  const SignupStepOne({Key? key}) : super(key: key);

  @override
  State<SignupStepOne> createState() => _SignupStepOneState();
}

class _SignupStepOneState extends State<SignupStepOne> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map data = {'name': String, 'email': String, 'phone': String};
  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return SignupTemplate(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Informações pessoais",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFE07274e),
              ),
            ),
            const SizedBox(height: 18.0),
            const Text(
              "Por favor, insira seu nome, seu endereço de email e seu número de celular",
              style: TextStyle(fontSize: 16, color: Color(0xFF9d9da6)),
            ),
            const SizedBox(height: 18.0),
            const Text(
              "Nome",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFE07274e)),
            ),
            TextFormField(
              validator: (val) =>
                  val!.isEmpty ? 'Por favor, digite seu nome.' : null,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'ex. Juliana Brito',
                filled: true,
                fillColor: const Color(0xffffffff),
                hintStyle:
                    const TextStyle(color: Color(0xFF9d9da6), fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      const BorderSide(color: Color(0xFF473DFF), width: 1),
                ),
              ),
              onSaved: (input) => data['name'] = input,
            ),
            const SizedBox(height: 16),
            const Text(
              "Email",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFE07274e)),
            ),
            TextFormField(
              validator: (val) =>
                  val!.isEmpty ? 'Por favor, digite seu email.' : null,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'ex. julianabrito@gmail.com',
                filled: true,
                fillColor: const Color(0xffffffff),
                hintStyle:
                    const TextStyle(color: Color(0xFF9d9da6), fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      const BorderSide(color: Color(0xFF473DFF), width: 1),
                ),
              ),
              onSaved: (input) => data['email'] = input,
            ),
            const SizedBox(height: 16),
            const Text(
              "Telefone",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFE07274e)),
            ),
            TextFormField(
              inputFormatters: [maskFormatter],
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Por favor, digite seu número de celular.';
                } else if (val.length != 15) {
                  return 'Número de celular inválido.\n';
                }
                return null;
              },
              onSaved: (input) => data['phone'] = input,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'ex. (99) 99999-9999',
                filled: true,
                fillColor: const Color(0xffffffff),
                hintStyle:
                    const TextStyle(color: Color(0xFF9d9da6), fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      const BorderSide(color: Color(0xFF473DFF), width: 1),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      context.read<PlanProvider>().updateAccount(data);
                      Navigator.pushNamed(context, '/second-step');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFE07274e),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    textStyle: const TextStyle(fontSize: 14.0),
                  ),
                  child: const Text("Próximo")),
            ),
          ],
        ),
      ),
    );
  }
}
