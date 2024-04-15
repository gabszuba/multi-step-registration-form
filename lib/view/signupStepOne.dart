import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5ECF6),
      body: Stack(
        children: [
          Stack(
            children: [
              _bgBar(),
            ],
          ),
          _formContainer(),
        ],
      ),
    );
  }
}

Widget _formContainer() {
  return Center(
    child: Container(
      alignment: Alignment.center,
      height: 550,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffffffff),
      ),
      child: const Center(
        child: Text(
          'Informações Pessoais',
          style: TextStyle(
            color: Color(0xFF02295A),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget _bgBar() {
  const String assetName = 'assets/bg-bar.svg';
  return SizedBox(
    width: double.infinity,
    child: SvgPicture.asset(
      assetName,
      semanticsLabel: 'Background Bar',
      fit: BoxFit.cover,
    ),
  );
}
