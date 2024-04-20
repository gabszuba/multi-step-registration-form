import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupTemplate extends StatelessWidget {
  final Widget? child; // Make child optional

  const SignupTemplate({Key? key, this.child}) : super(key: key);

  //List<bool> _selectedPage = <bool> [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5ECF6),
      body: Stack(
        children: [
          _bgBar(),
          _formContainer(),
        ],
      ),
    );
  }

  Widget _formContainer() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffffffff),
        ),
        child: IntrinsicHeight (child: child,),
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
}
