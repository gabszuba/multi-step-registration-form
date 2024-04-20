import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_step_form/view/signUpTemplate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinalStep extends StatelessWidget {
  const FinalStep({super.key});

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/icon-thank-you.svg';
    return SignupTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetName,
            semanticsLabel: "Thank you icon",
          ),
          const SizedBox(height: 24),
          const Text(
            "Compra confirmada",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFE07274e),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Obrigada por comprar nosso produto. Caso tenha dúvidas ou problemas com a plataforma, entre em contato com o Fale Conosco.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF9d9da6)),
          )
        ],
      ),
    );
  }
}
